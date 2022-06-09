import 'package:payBISUI/app-contact.class.dart';
import 'package:payBISUI/pages/contact-details.dart';
import 'package:flutter/material.dart';
import 'package:payBISUI/widgets/searchbar.dart';
import 'package:payBISUI/widgets/widgets.dart';

import 'contact-avatar.dart';
import 'package:payBISUI/screens/split_slide.dart';
import 'package:google_fonts/google_fonts.dart';

List<SplitField> splitfields = [];
List items = [];
List items_filtered = [];

GlobalKey<_ListofContactsState> textGlobalKey_contacts =
    GlobalKey<_ListofContactsState>();

deleteSplit(name) {
  print(name);
  int c1 = 0;
  var toRemove = [];
  splitfields.forEach((e) {
    if (e.name == name) {
      toRemove.add(e);
    }
    c++;
  });
  items.forEach((element) {
    if (element["name"] == name) {
      element["value"] = false;
    }
    // print(element);
  });

  splitfields.removeWhere((e) => toRemove.contains(e));
  textGlobalKey.currentState.setstate_function();
  textGlobalKey_contacts.currentState.set_state_fun();

  print(splitfields.length);
  // print(splitfields.)
}

class ContactsList extends StatefulWidget {
  bool isSearching;
  final List<AppContact> contacts;
  Function() reloadContacts;
  TextEditingController searchController;
  final List<AppContact> contactsFiltered;

  ContactsList(
      {Key key,
      this.contacts,
      this.reloadContacts,
      this.isSearching,
      this.searchController,
      this.contactsFiltered})
      : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return ListofContacts(
        key: textGlobalKey_contacts,
        widget: widget,
        items_filtered: items_filtered);
  }
}

class ListofContacts extends StatefulWidget {
  const ListofContacts({
    Key key,
    @required this.widget,
    @required this.items_filtered,
  }) : super(key: key);

  final ContactsList widget;

  final List items_filtered;

  @override
  State<ListofContacts> createState() => _ListofContactsState();
}

class _ListofContactsState extends State<ListofContacts> {
  void set_state_fun() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    print('${[widget.widget.contacts.length]}');

    print("object1111");

    addtolist();
    widget.widget.searchController.addListener(() {
      print(contactsFiltered.length);

      contactsFiltered.forEach((element) {
        if (widget.widget.searchController.text != "") {
          getCode(element.info.displayName);
        }

        // print(items);
      });
    });
  }

  getCode(name) {
    // print("${code}  ");
    items.forEach((element) {
      if (element["name"] == name) {
        items_filtered.add(element);

        // setState(() {
        //   items = items_filtered;
        // });
        return element;
      }
    });
    // items_filtered.clear();
  }

  addSplit(name) {
    print('${[name]}');
    splitfields.add(new SplitField(name: name));
    textGlobalKey.currentState.setstate_function();
  }

  addtolist() {
    // print('he;;;;;;lllooo');
    // print('${[items.length, widget.contacts]}');

    int cnt = 0;
    List _items = [];
    // var obj;
    widget.widget.contacts.forEach((element) {
      var obj = {
        "id": cnt,
        "value": false,
        "name": element.info.displayName,
      };
      cnt++;
      _items.add(obj);

      // print(obj);
    });

    setState(() {
      items = _items;
      print('${[_items.length, items.length]}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              // key: listGlobal,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.widget.contacts.length,
                itemBuilder: (context, index) {
                  AppContact contact = widget.widget.contacts[index];

                  return Material(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                  onTap: () {
                                    print(widget.widget.isSearching);
                                  },
                                  title: Text(contact.info.displayName),
                                  subtitle: Text(contact.info.phones.length > 0
                                      ? contact.info.phones.elementAt(0).value
                                      : ''),
                                  leading: ContactAvatar(contact, 36, index)),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    right: 25.0, bottom: 4),
                                child: (widget.widget.isSearching != true)
                                    ? Transform.scale(
                                        scale: 1.3,
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          90)),
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

                                                  // print(selected);
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    : Transform.scale(
                                        scale: 1.3,
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          90)),
                                              activeColor: Colors.red,
                                              value: widget.items_filtered[
                                                  widget.items_filtered.length -
                                                      contactsFiltered.length +
                                                      index]["value"],
                                              onChanged: (value) {
                                                (value == true)
                                                    ? addSplit(
                                                        widget
                                                            .items_filtered[widget
                                                                .items_filtered
                                                                .length -
                                                            contactsFiltered
                                                                .length +
                                                            index]["name"],
                                                      )
                                                    : deleteSplit(widget
                                                        .items_filtered[widget
                                                            .items_filtered
                                                            .length -
                                                        contactsFiltered
                                                            .length +
                                                        index]["name"]);

                                                setState(() {
                                                  widget.items_filtered[widget
                                                          .items_filtered
                                                          .length -
                                                      contactsFiltered.length +
                                                      index]["value"] = value;
                                                  // print(selected);
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ))
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        // Spacer()
      ],
    );
  }
}

class SplitField extends StatelessWidget {
  final String name;
  final String contact;
  TextEditingController controller = new TextEditingController();

  SplitField({Key key, this.name, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      height: 50,
      width: 300,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 22,
            child: ClipRRect(
              child: Image.asset(
                  '/Users/juttugajendraanurag/Desktop/ui/assets/images/avatar_img.png'),
              borderRadius: BorderRadius.circular(90),
            ),
          ),
          SizedBox(width: 16),
          Container(
              width: 120,
              child: Text(
                name,
                style: GoogleFonts.lexend(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              )),

          // color: Colors.amber,
          // child: TextWidget(fontsize: 20, text: name, color: 0xff000000)),
          // SizedBox(width: 60),
          Container(
              margin: EdgeInsets.only(top: 0),

              // height: 75,
              // color: Colors.amber,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.currency_rupee,
                    size: 20,
                  ),
                  Container(
                    // height: 70,
                    // color: Colors.red,
                    child: Column(
                      children: <Widget>[
                        Container(
                          // alignment: Alignment.bottomLeft,
                          // color: Colors.blue,
                          width: 70,
                          height: 40,
                          // padding: EdgeInsets.only(bottom: 0),

                          child: TextField(
                            // cursorHeight: 15,
                            cursorColor: Colors.black,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ),
                        Container(
                            color: Colors.black,
                            height: 1,
                            width: 70,
                            child: Text("hi")),
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
