import 'package:flutter/material.dart';

import '../widgets/usericon.dart';
import '../widgets/textbox.dart';

class PayUI extends StatefulWidget {
  const PayUI({Key key}) : super(key: key);

  @override
  _PayUIState createState() => _PayUIState();
}

class _PayUIState extends State<PayUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141212),
      body: ListView(physics: BouncingScrollPhysics(), children: <Widget>[
        Container(
          height: 50,
          // color: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 35,
                color: Colors.white,
                icon: Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              Ink(
                  // decoration: BoxDecoration(
                  //   border: Border.all(width: 1.0, color: Color(0xFFFFFFFF)),
                  //   borderRadius: BorderRadius.all(Radius.circular(90.0)),
                  // ),
                  child: IconButton(
                iconSize: 35,
                color: Colors.white,
                icon: Icon(Icons.more_horiz),
                onPressed: () {},
              ))
            ],
          ),
        ),
        Container(
          color: Color(0xff525252),
          height: 0.5,
        ),
        Container(
          color: Color(0xff1C1C1E),
          height: 112,
          child: Container(
            margin: EdgeInsets.only(right: 50, left: 60),
            child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  UserIcon(
                      name: "Juttu",
                      iconimage:
                          "/Users/juttugajendraanurag/Desktop/ui/assets/images/user_image1.png"),
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    padding: EdgeInsets.all(18),
                    child: Image.asset(
                      '/Users/juttugajendraanurag/Desktop/ui/assets/images/arrow_front.png',
                      color: Colors.white,
                    ),
                  ),
                  UserIcon(
                      name: "Canteen",
                      iconimage:
                          "/Users/juttugajendraanurag/Desktop/ui/assets/images/user_image2.jpeg"),
                ]),
          ),
        ),
        Container(
          color: Color(0xff525252),
          height: 0.5,
        ),
        Container(
          height: 353,
          color: Color(0xff101010),
          child: Column(
            children: <Widget>[
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 75, left: 77, right: 80),
                child: TextBox(hint: "0", icon: 0),
              ),
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 24, left: 77, right: 80),
                // color: Colors.grey[200],
                child: TextBox(hint: "For ?", icon: 1),
              ),
            ],
          ),
        ),
        
      ]),
    );
  }
}

// Container(
//         margin: EdgeInsets.only(top: 30),
//         child: TextField(
//           autocorrect: false,
//           enableSuggestions: false,
//           keyboardType: TextInputType.emailAddress,
//           decoration: new InputDecoration(hintText: "Enter text"),
//           autofocus: true,
//         ),
//       ),
