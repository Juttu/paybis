import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      decoration: BoxDecoration(
          color: Color(0xffF2F3F5),
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.grey[300]),
            bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
          )),
    );
  }
}
