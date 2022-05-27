import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 1.5),
      child: CircleAvatar(
        radius: 18,
        child: ClipRRect(
          child: Image.asset(
              '/Users/juttugajendraanurag/Desktop/ui/assets/images/avatar_img.png'),
          borderRadius: BorderRadius.circular(90),
        ),
      ),
    );
  }
}
