import 'package:payBISUI/app-contact.class.dart';
import 'package:payBISUI/data/data.dart';
import 'package:payBISUI/pages/contact-details.dart';
import 'package:flutter/material.dart';
import 'package:payBISUI/widgets/searchbar.dart';
import 'package:payBISUI/widgets/widgets.dart';

import '../models/user_model.dart';
import '../widgets/recentswidget.dart';
import 'contact-avatar.dart';
import 'package:payBISUI/screens/split_slide.dart';
import 'package:google_fonts/google_fonts.dart';

List<SplitField> splitfields = [];
List items = [];
List items_filtered = [];
List img_arr = [
  "cartoon1.png",
  "cartoon2.jpeg",
  "cartoon3.jpeg",
  "cartoon4.png",
  "cartoon5.jpeg",
  "cartoon6.jpeg",
  "cartoon7.jpeg",
  "cartoon8.jpeg",
  "cartoon9.png",
  "cartoon10.jpeg",
];

GlobalKey<_ListofContactsState> textGlobalKey_contacts =
    GlobalKey<_ListofContactsState>();

deleteSplit(name) {
  // print(name);
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
  recentitems.forEach((element1) {
    if (element1["name"] == name) {
      // print(element1["name"] + "NAMEEEEE");
      element1["value"] = false;
      // print(element1["value"]);
    }
  });

  splitfields.removeWhere((e) => toRemove.contains(e));
  textGlobalKey.currentState.setstate_function();
  textGlobalKey_contacts.currentState.set_state_fun();

  textGlobalKey_recents.currentState.recentwidget_setstate();

  // print(splitfields.length);
  // print(splitfields.)
}

addSplit(name, imageurl) {
  // print('${[name]}');
  splitfields.add(new SplitField(name: name, image: imageurl));
  recentitems.forEach((element1) {
    if (element1["name"] == name) {
      // print(element1["name"] + "NAMEEEEE");
      element1["value"] = true;
      // print(element1["value"]);
    }
  });
  splitfields.forEach((element) {
    element.myController.text = "1";
  });
  textGlobalKey.currentState.setstate_function();
  textGlobalKey_recents.currentState.recentwidget_setstate();
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
  List<int> final_index = [];

  void set_state_fun() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // print('${[widget.widget.contacts.length]}');

    // print("object1111");

    addtolist();
    widget.widget.searchController.addListener(() {
      // print(contactsFiltered.length);

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

  addtolist() {
    // print('he;;;;;;lllooo');
    // print('${[items.length, widget.contacts]}');
    int re = (widget.widget.contacts.length / img_arr.length).toInt();
    // print(re);
    int rem = widget.widget.contacts.length - img_arr.length * re;
    for (int i = 0; i < re; i++) {
      for (int j = 0; j < img_arr.length; j++) {
        final_index.add(j);
      }
    }
    if (rem != 0) {
      for (int k = 0; k < rem; k++) {
        final_index.add(k);
      }
    }
    // print(final_index);

    int cnt = 0;
    List _items = [];
    // var obj;
    widget.widget.contacts.forEach((element) {
      try {
        var obj = {
          "id": cnt,
          "value": false,
          "name": element.info.displayName,
          "image":
              '/Users/juttugajendraanurag/Desktop/ui/assets/images/${img_arr[final_index[cnt]]}'
        };
        cnt++;
        _items.add(obj);
      } catch (e) {
        print(e);
      }
    });
    // print(users_list);

    setState(() {
      items = _items;
      // print('${[_items.length, items.length]}');
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
                padding: EdgeInsets.only(top: 10),
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.widget.contacts.length,
                itemBuilder: (context, index) {
                  AppContact contact = widget.widget.contacts[index];

                  return Material(
                    // elevation: 5,

                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  ListTile(
                                      onTap: () {
                                        // print(recents);
                                      },
                                      title: Text(
                                        contact.info.displayName,
                                        style: GoogleFonts.lexend(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      subtitle: Text(
                                        contact.info.phones.length > 0
                                            ? contact.info.phones
                                                .elementAt(0)
                                                .value
                                            : '',
                                        style: GoogleFonts.lexend(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      leading: ContactAvatar(
                                          contact,
                                          45,
                                          widget.widget.contacts.length,
                                          index)),
                                ],
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    right: 25.0, bottom: 4),
                                child: (widget.widget.isSearching != true)
                                    ? Transform.scale(
                                        scale: 1.2,
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
                                                        items[index]["name"],
                                                        items[index]["image"])
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
                                        scale: 1.2,
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
                                                        widget
                                                            .items_filtered[widget
                                                                .items_filtered
                                                                .length -
                                                            contactsFiltered
                                                                .length +
                                                            index]["image"],
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
                        Container(
                          margin: EdgeInsets.only(left: 80),
                          color: Color(0xffEBEBEC),
                          height: 1,
                          width: 1900,
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
  final String image;
  TextEditingController myController = new TextEditingController();

  SplitField({Key key, this.name, this.contact, this.image}) : super(key: key);

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
            radius: 23,
            child: ClipRRect(
              child: Image.asset(image),
              borderRadius: BorderRadius.circular(90),
            ),
          ),
          SizedBox(width: 16),
          Container(
              width: 120,
              height: 23,
              child: Text(
                name,
                style: GoogleFonts.lexend(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              )),
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
                            controller: myController,
                            keyboardType: TextInputType.numberWithOptions(),
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
                          margin: EdgeInsets.zero,
                          color: Colors.grey[900],
                          height: 1.5,
                          width: 70,
                        ),
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
