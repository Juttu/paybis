import 'package:payBISUI/app-contact.class.dart';
import 'package:payBISUI/pages/contact-details.dart';
import 'package:flutter/material.dart';

import 'contact-avatar.dart';
import 'package:payBISUI/screens/split_slide.dart';
import 'package:google_fonts/google_fonts.dart';

List<SplitField> splitfields = [];

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
  List items = [];
  List items_filtered = [];

  @override
  void initState() {
    super.initState();
    // print('${[widget.contacts]}');
    print("object1111");

    addtolist();
    widget.searchController.addListener(() {
      print(contactsFiltered.length);

      contactsFiltered.forEach((element) {
        if (widget.searchController.text != "") {
          getCode(
              element.info.phones.elementAt(0).value, element.info.displayName);
        }

        // print(items);
      });
    });
  }

  getCode(code, name) {
    // print("${code}  ");
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

  addtolist() {
    int cnt = 0;
    List _items = [];
    // print(contacts);
    // var obj;
    widget.contacts.forEach((element) {
      var obj = {
        "id": cnt,
        "value": false,
        "name": element.info.displayName,
        "contact": element.info.phones.elementAt(0).value
      };
      cnt++;
      _items.add(obj);
      // print(_items);
    });
    // print('${[_items.length, items.length, widget.contacts]}');
    setState(() {
      items = _items;
      // print('${[_items.length, items.length]}');
    });
  }

  addSplit(name, contact) {
    print('${[name, contact]}');
    splitfields.add(new SplitField(name: name, contact: contact));
    textGlobalKey.currentState.setstate_function();
  }

  deleteSplit(name, contact) {
    int c1 = 0;
    var toRemove = [];
    splitfields.forEach((e) {
      if (e.name == name && e.contact == contact) {
        toRemove.add(e);
      }
      c++;
    });
    splitfields.removeWhere((e) => toRemove.contains(e));
    textGlobalKey.currentState.setstate_function();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.contacts.length,
                  itemBuilder: (context, index) {
                    AppContact contact = widget.contacts[index];

                    return Material(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                    onTap: () {
                                      print(widget.isSearching);
                                    },
                                    title: Text(contact.info.displayName),
                                    subtitle: Text(contact.info.phones.length >
                                            0
                                        ? contact.info.phones.elementAt(0).value
                                        : ''),
                                    leading: ContactAvatar(contact, 36)),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      right: 25.0, bottom: 4),
                                  child: (widget.isSearching != true)
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
                                                          items[index]["name"],
                                                          items[index]
                                                              ["contact"])
                                                      : deleteSplit(
                                                          items[index]["name"],
                                                          items[index]
                                                              ["contact"]);

                                                  setState(() {
                                                    items[index]["value"] =
                                                        value;

                                                    // print(selected);
                                                  });
                                                },
                                              ),
                                              Text(widget.contacts.length
                                                  .toString()),
                                              Text(items.length.toString())
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
                                                value: items_filtered[
                                                    items_filtered.length -
                                                        contactsFiltered
                                                            .length +
                                                        index]["value"],
                                                onChanged: (value) {
                                                  (value == true)
                                                      ? addSplit(
                                                          items_filtered[items_filtered
                                                                  .length -
                                                              contactsFiltered
                                                                  .length +
                                                              index]["name"],
                                                          items_filtered[items_filtered
                                                                  .length -
                                                              contactsFiltered
                                                                  .length +
                                                              index]["contact"])
                                                      : deleteSplit(
                                                          items_filtered[items_filtered
                                                                  .length -
                                                              contactsFiltered
                                                                  .length +
                                                              index]["name"],
                                                          items_filtered[items_filtered
                                                                  .length -
                                                              contactsFiltered
                                                                  .length +
                                                              index]["contact"]);

                                                  setState(() {
                                                    items_filtered[
                                                            items_filtered
                                                                    .length -
                                                                contactsFiltered
                                                                    .length +
                                                                index]
                                                        ["value"] = value;
                                                    // print(selected);
                                                  });
                                                },
                                              ),
                                              Material(
                                                child: Text(
                                                  widget.contacts.length
                                                      .toString(),
                                                  style: GoogleFonts.lato(
                                                      fontSize: 20,
                                                      color: Colors.amber),
                                                ),
                                              ),
                                              Text(items.length.toString())
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
        ],
      ),
    );
  }
}

class SplitField extends StatelessWidget {
  final String name;
  final String contact;
  const SplitField({Key key, this.name, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name),
    );
  }
}
