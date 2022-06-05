import 'package:payBISUI/app-contact.class.dart';
import 'package:payBISUI/components/contacts-list.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../widgets/searchbar.dart';

void main() => runApp(SplitSlide());

var c = 25;
List<AppContact> contactsFiltered = [];
GlobalKey<_SplitPeopleState> textGlobalKey = GlobalKey<_SplitPeopleState>();

class SplitSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Contacts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Contacts'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<AppContact> contacts = [];
  Map<String, Color> contactsColorMap = new Map();
  TextEditingController searchController = new TextEditingController();
  bool contactsLoaded = false;

  @override
  void initState() {
    super.initState();
    getPermissions();
  }

  getPermissions() async {
    if (await Permission.contacts.request().isGranted) {
      getAllContacts();
      searchController.addListener(() {
        print("listner");
        filterContacts();
      });
    }
  }

  String flattenPhoneNumber(String phoneStr) {
    return phoneStr.replaceAllMapped(RegExp(r'^(\+)|\D'), (Match m) {
      return m[0] == "+" ? "+" : "";
    });
  }

  getAllContacts() async {
    List colors = [Colors.green, Colors.indigo, Colors.yellow, Colors.blue];
    int colorIndex = 0;
    List<AppContact> _contacts =
        (await ContactsService.getContacts()).map((contact) {
      Color baseColor = colors[colorIndex];
      colorIndex++;
      if (colorIndex == colors.length) {
        colorIndex = 0;
      }
      return new AppContact(info: contact, color: baseColor);
    }).toList();
    setState(() {
      contacts = _contacts;
      contactsLoaded = true;
    });
  }

  filterContacts() {
    List<AppContact> _contacts = [];
    _contacts.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      _contacts.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase();
        String searchTermFlatten = flattenPhoneNumber(searchTerm);
        String contactName = contact.info.displayName.toLowerCase();
        bool nameMatches = contactName.contains(searchTerm);
        if (nameMatches == true) {
          return true;
        }

        if (searchTermFlatten.isEmpty) {
          return false;
        }

        var phone = contact.info.phones.firstWhere((phn) {
          String phnFlattened = flattenPhoneNumber(phn.value);
          return phnFlattened.contains(searchTermFlatten);
        }, orElse: () => null);

        return phone != null;
      });
    }
    setState(() {
      // print('${[_contacts.length, "Length"]}');
      // print('${[contactsFiltered.length, "Length"]}');

      contactsFiltered = _contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
    bool listItemsExist =
        ((isSearching == true && contactsFiltered.length >= 0) ||
            (isSearching != true && contacts.length >= 0));
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SplitPeople(
              key: textGlobalKey,
            ),
            SearchBar(searchController: searchController),
            contactsLoaded == true
                ? // if the contacts have not been loaded yet
                listItemsExist == true
                    ? // if we have contacts to show
                    ContactsList(
                        reloadContacts: () {
                          getAllContacts();
                        },
                        contacts:
                            isSearching == true ? contactsFiltered : contacts,
                        isSearching: isSearching,
                        searchController: searchController,
                        contactsFiltered: contactsFiltered)
                    : Container(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          isSearching
                              ? 'No search results to show'
                              : 'No contacts exist',
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ))
                : Container(
                    // still loading contacts
                    padding: EdgeInsets.only(top: 40),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

class SplitPeople extends StatefulWidget {
  const SplitPeople({
    Key key,
  }) : super(key: key);

  @override
  State<SplitPeople> createState() => _SplitPeopleState();
}

class _SplitPeopleState extends State<SplitPeople> {
  void setstate_function() {
    setState(() {});
    // print("SETSTATE");
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),

        shrinkWrap: true,
        // controller: sc,
        itemCount: splitfields.length,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            padding: const EdgeInsets.all(2),
            child: Row(
              children: <Widget>[
                splitfields[i],
                IconButton(
                    onPressed: () {
                      deleteSplit(splitfields[i].name);
                    },
                    icon: Icon(Icons.close))
              ],
            ),
          );
        },
      ),
    );
  }
}
