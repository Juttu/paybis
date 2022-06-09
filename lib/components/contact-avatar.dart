import 'package:payBISUI/app-contact.class.dart';
import 'package:payBISUI/utils/get-color-gradient.dart';
import 'package:flutter/material.dart';

class ContactAvatar extends StatelessWidget {
  ContactAvatar(this.contact, this.size, this.index);
  final AppContact contact;
  final double size;
  final int index;

  List img_arr = ["cartoon1.png", "cartoon2.jpeg"];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            shape: BoxShape.circle, gradient: getColorGradient(contact.color)),
        child: (contact.info.avatar != null && contact.info.avatar.length > 0)
            ? CircleAvatar(
                backgroundImage: MemoryImage(contact.info.avatar),
              )
            : CircleAvatar(
                radius: 32,
                child: ClipRRect(
                  child: Image.asset(
                      '/Users/juttugajendraanurag/Desktop/ui/assets/images/${img_arr[0]}'),
                  borderRadius: BorderRadius.circular(90.0),
                ),
              ));
  }
}
