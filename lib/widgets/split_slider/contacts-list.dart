// import 'package:flutter/material.dart';

// import '../../models/app-contact.class.dart';
// import 'contact-avatar.dart';
// import 'contact-details.dart';

// class ContactsList extends StatelessWidget {
//   final List<AppContact> contacts;
//   Function() reloadContacts;
//   ContactsList({Key key, this.contacts, this.reloadContacts}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.builder(
//         physics: ClampingScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: contacts.length,
//         itemBuilder: (context, index) {
//           AppContact contact = contacts[index];

//           return ListTile(
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (BuildContext context) => ContactDetails(
//                           contact,
//                           onContactDelete: (AppContact _contact) {
//                             reloadContacts();
//                             Navigator.of(context).pop();
//                           },
//                           onContactUpdate: (AppContact _contact) {
//                             reloadContacts();
//                           },
//                         )));
//               },
//               title: Text(contact.info.displayName.toString()),
//               subtitle: Text(contact.info.phones.elementAt(0).value ),
//               leading: ContactAvatar(contact, 36));
//         },
//       ),
//     );
//   }
// }
