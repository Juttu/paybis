import 'package:payBISUI/app-contact.class.dart';
import 'package:payBISUI/utils/get-color-gradient.dart';
import 'package:flutter/material.dart';

class ContactAvatar extends StatefulWidget {
  ContactAvatar(this.contact, this.size, this.index,this.real_index);
  final AppContact contact;
  final double size;
  final int index;
  final int real_index;

  @override
  State<ContactAvatar> createState() => _ContactAvatarState();
}

class _ContactAvatarState extends State<ContactAvatar> {
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
  List<int> final_index = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(widget.index);
    int re = (widget.index / img_arr.length).toInt();
    // print(re);
    int rem = widget.index - img_arr.length * re;
    // print(rem);
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: getColorGradient(widget.contact.color)),
        child: (widget.contact.info.avatar != null &&
                widget.contact.info.avatar.length > 0)
            ? CircleAvatar(
                backgroundImage: MemoryImage(widget.contact.info.avatar),
              )
            : CircleAvatar(
                // radius: 32,
                child: ClipRRect(
                  child: Image.asset(
                      '/Users/juttugajendraanurag/Desktop/ui/assets/images/${img_arr[final_index[widget.real_index]]}'),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ));
  }
}
