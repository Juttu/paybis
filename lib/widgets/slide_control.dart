import 'dart:ffi';
import 'dart:convert';

import 'package:contacts_app/widgets/searchbar.dart';
import 'package:contacts_app/widgets/textbox.dart';
import 'package:flutter/material.dart';

import 'package:contacts_service/contacts_service.dart';

class SlideWidget extends StatefulWidget {
  const SlideWidget({Key key}) : super(key: key);
  // final ScrollController scrollController;

  @override
  _SlideWidgetState createState() => _SlideWidgetState();
}

class _SlideWidgetState extends State<SlideWidget> {
  bool value = false;
  String selected = "";

  List<Contact> contacts = [];
  List items = [];
  List items_filtered = [];
  List items_filtered_final = [];

  List<Contact> contacts_filtered = [];
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    getAllContacts();
    searchController.addListener(() {
      filterContacts();
    });
    print("${searchController.text}WOOOWW");
  }

  getCode(code, name) {
    print("${code}  ");
    items.forEach((element) {
      if (element["contact"] == code && element["name"] == name) {
        items_filtered.add(element);

        // setState(() {
        //   items = items_filtered;
        // });
        return element;
      }
    });
    // items_filtered.clear();
  }

  filterContacts() {
    List<Contact> _contacts = [];
    _contacts.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      _contacts.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase();
        String contactName = contact.displayName.toLowerCase();
        return contactName.contains(searchTerm);
      });
      setState(() {
        contacts_filtered = _contacts;
      });
      // setState(() {
      contacts_filtered.forEach((element) {
        getCode(element.phones.elementAt(0).value, element.displayName);
        // print("${items_filtered}  CODE");
        // });
        // items_filtered.clear();
      });
    } else {
      setState(() {
        contacts_filtered = _contacts;
      });
    }
  }

  getAllContacts() async {
    int cnt = 0;
    List<Contact> _contacts = await ContactsService.getContacts();
    List _items = [];
    setState(() {
      contacts = _contacts;
      items = _items;
    });

    // print(contacts);

    contacts.forEach((element) {
      var obj = {
        "id": cnt,
        "value": false,
        "name": element.displayName,
        "contact": element.phones.elementAt(0).value
      };

      _items.add(obj);
      cnt++;
    });
    // print(_items);
    print("object");
  }

  List<SplitAmount> splitlist = [];

  addSplit(profile) {
    splitlist.add(new SplitAmount(profile: profile));
    print(splitlist);
    // print(profile);
    setState(() {});
  }

  deleteSplit(profile) {
    // print(profile);
    int c = 0;
    splitlist.forEach((element) {
      if (element.profile == profile) {
        splitlist.removeAt(c);

        // setState(() {});

        // print(c);
      }
      c++;
    });
    print("DELETE");
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            // height: 500,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: ClampingScrollPhysics(), // <----

              shrinkWrap: true,
              // controller: sc,
              itemCount: splitlist.length,
              itemBuilder: (BuildContext context, int i) {
                return Container(
                  padding: const EdgeInsets.all(2),
                  child: splitlist[i],
                );
              },
            ),
          ),
          SearchBar(searchController: searchController),
          Container(
            height: 800,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.only(top: 20), // <----

                    shrinkWrap: true,
                    itemCount: isSearching == true
                        ? contacts_filtered.length
                        : contacts.length,
                    itemBuilder: (context, index) {
                      Contact contact = isSearching == true
                          ? contacts_filtered[index]
                          : contacts[index];

                      return Container(
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: ListTile(
                                      title: Text(contact.displayName),
                                      subtitle: Text(
                                          contact.phones.elementAt(0).value),
                                      leading: (contact.avatar != null &&
                                              contact.avatar.length > 0)
                                          ? CircleAvatar(
                                              backgroundImage:
                                                  MemoryImage(contact.avatar),
                                            )
                                          : CircleAvatar(
                                              child: Text(contact.initials()),
                                            )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 25.0, bottom: 4),
                                  child: (isSearching != true)
                                      ? Transform.scale(
                                          //Not Searching
                                          scale: 1.3,
                                          child: Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(90)),
                                            activeColor: Colors.red,
                                            value: items[index]["value"],
                                            onChanged: (value) {
                                              (value == true)
                                                  ? addSplit(
                                                      items[index]["name"])
                                                  : deleteSplit(
                                                      items[index]["name"]);

                                              setState(() {
                                                items[index]["value"] = value;
                                                selected =
                                                    "${items[index]["id"]}, ${items[index]["name"]}, ${items[index]["value"]}, ${items[index]["contact"]}";
                                                // print(selected);
                                              });
                                            },
                                          ),
                                        )
                                      : Transform.scale(
                                          //Searching
                                          scale: 1.3,
                                          child: Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            activeColor: Colors.red,
                                            value: items_filtered[
                                                items_filtered.length -
                                                    contacts_filtered.length +
                                                    index]["value"],
                                            onChanged: (value) {
                                              (value == true)
                                                  ? addSplit(items_filtered[
                                                      items_filtered.length -
                                                          contacts_filtered
                                                              .length +
                                                          index]["name"])
                                                  : deleteSplit(items_filtered[
                                                      items_filtered.length -
                                                          contacts_filtered
                                                              .length +
                                                          index]["name"]);
                                              setState(() {
                                                items_filtered[items_filtered
                                                        .length -
                                                    contacts_filtered.length +
                                                    index]["value"] = value;
                                                selected =
                                                    "${items_filtered[items_filtered.length - contacts_filtered.length + index]["id"]}, ${items_filtered[items_filtered.length - contacts_filtered.length + index]["name"]}, ${items_filtered[items_filtered.length - contacts_filtered.length + index]["value"]}, ${items_filtered[items_filtered.length - contacts_filtered.length + index]["contact"]}";
                                                print(selected);
                                              });
                                            },
                                          ),
                                        ),
                                )
                              ],
                            ),
                            Container(
                              child: Divider(
                                height: 5,
                                thickness: 1,
                                indent: 60,
                                endIndent: 0,
                                color: Colors.grey[200],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class SplitAmount extends StatelessWidget {
  final String profile;
  const SplitAmount({Key key, this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.red,
        height: 70,
        margin: EdgeInsets.only(left: 10, right: 30),
        child: Row(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                // height: 65,
                // color: Colors.amber,
                child: Icon(Icons.close, size: 30)),
            Container(
              // color: Colors.white,
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 50,
                child: ClipRRect(
                  child: Image.asset(
                      '/Users/juttugajendraanurag/Desktop/ui/assets/images/cartoon2.jpeg'),
                  borderRadius: BorderRadius.circular(90.0),
                ),
              ),
            ),
            SizedBox(width: 30),
            Container(
                alignment: Alignment.center,
                // height: 65,
                // color: Colors.amber,
                child: Icon(Icons.currency_rupee, size: 40)),
            SizedBox(width: 10),
            TextBoxInside(
              hint: "Sh",
              bar_color: 0xff000000,
            ),
          ],
        ));
  }
}
