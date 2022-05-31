import 'dart:ffi';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ui/models/models.dart';
import "package:ui/data/data.dart";
import 'package:ui/widgets/widgets.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:ui/functions/print.dart';

class SlideWidget extends StatefulWidget {
  const SlideWidget({Key? key}) : super(key: key);
  // final ScrollController scrollController;

  @override
  _SlideWidgetState createState() => _SlideWidgetState();
}

class _SlideWidgetState extends State<SlideWidget> {
  bool value = false;
  List<Contact> contacts = [];

  List<Contact> contacts_filtered = [];
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    getAllContacts();
    searchController.addListener(() {
      filterContacts();
    });
    print("${searchController.text}");
  }

  filterContacts() {
    List<Contact> _contacts = [];
    _contacts.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      _contacts.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase();
        String contactName = contact.displayName!.toLowerCase();
        return contactName.contains(searchTerm);
      });
      setState(() {
        contacts_filtered = _contacts;
      });
    } else {
      setState(() {
        contacts_filtered = _contacts;
      });
    }
  }

  getAllContacts() async {
    List<Contact> _contacts = await ContactsService.getContacts();
    setState(() {
      contacts = _contacts;
    });
    print(contacts[0].phones!.elementAt(0).value);
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
    return Column(
      children: <Widget>[
        Container(
          height: 45,
          margin: EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          child: Row(
              //Center Column contents horizontally,
              children: <Widget>[
                SizedBox(width: 10),
                Icon(
                  Icons.search,
                  color: Colors.grey[600],
                  size: 28,
                ),
                SizedBox(width: 10),
                Container(
                  child: Expanded(
                      child: TextField(
                    controller: searchController,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Search Contacts"),
                  )),
                )
              ]),
        ),
        Container(
          // color: Colors.red,
          child: Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: isSearching == true
                  ? contacts_filtered.length
                  : contacts.length,
              itemBuilder: (context, index) {
                Contact contact = isSearching == true
                    ? contacts_filtered[index]
                    : contacts[index];

                return Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                            title: Text(contact.displayName!),
                            subtitle: Text(contact.phones!.elementAt(0).value!),
                            leading: (contact.avatar != null &&
                                    contact.avatar!.length > 0)
                                ? CircleAvatar(
                                    backgroundImage:
                                        MemoryImage(contact.avatar!),
                                  )
                                : CircleAvatar(
                                    child: Text(contact.initials()),
                                  )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:25.0),
                        child: Checkbox(
                          value: value,
                          onChanged: (value) {
                            setState(() {
                              this.value = value!;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
