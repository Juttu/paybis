import 'dart:async';

import 'package:ui/models/models.dart';
import 'package:flutter/material.dart';
import 'package:ui/screens/pay_page.dart';
import 'package:ui/screens/main_paypage.dart';
import 'package:ui/test_screens/slide.dart';
import 'package:ui/test_screens/slide_check.dart';

class All extends StatefulWidget {
  const All({Key? key}) : super(key: key);

  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(children: <Widget>[
        RaisedButton(
          color: Colors.blue, // background
          textColor: Colors.white, // foreground
          // Within the `FirstRoute` widget
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPayPage()),
            );
          },
          child: Text('Scan and pay'),
        ),
        RaisedButton(
          color: Colors.blue, // background
          textColor: Colors.white, // foreground
          // Within the `FirstRoute` widget
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SlideCheck()),
            );
          },
          child: Text('Scan and pay'),
        ),
      ]),
    );
  }
}
