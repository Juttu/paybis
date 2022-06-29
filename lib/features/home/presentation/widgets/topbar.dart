import 'package:flutter/material.dart';

import '../../../../widgets/text.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            margin: EdgeInsets.only(left: 19),
            child: Lexend(
              text: "Hi, Juttu",
              fontsize: 32,
              color: 0xffffffff,
              fontweight: 1,
            )),
        Container(
            margin: EdgeInsets.only(right: 19),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                'assets/images/cartoon3.jpeg',
              ),
            )),
      ],
    );
  }
}
