import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextBox extends StatelessWidget {
  final String hint;
  final int icon;
  List<IconData> _icons = [
    Icons.currency_rupee_outlined,
    Icons.emoji_food_beverage_rounded
  ];

  TextBox({Key key,  this.hint,  this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(
          width: 55,
          decoration: BoxDecoration(
              color: Color(0xff373A3F),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(width: 1.5, color: Color(0xffffffff))),
          child: Container(
            height: 55,
            width: 55,
            alignment: Alignment.center,
            child: Icon(
              _icons[icon],
              size: 35,
              color: Colors.white,
            ),
          )),
      SizedBox(width: 10),
      TextBoxInside(
        hint: hint,
        bar_color: 0xffffffff,
      ),
    ]);
  }
}

class TextBoxInside extends StatelessWidget {
  final int bar_color;

  const TextBoxInside({Key key,  this.hint,  this.bar_color})
      : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 4),
              child: TextField(
                style: GoogleFonts.lato(fontSize: 36, color: Color(bar_color)),
                cursorHeight: 40,
                cursorColor: Colors.white,
                cursorWidth: 2.5,
                cursorRadius: Radius.circular(20),
                decoration: InputDecoration.collapsed(

                    // your code here

                    hintText: hint,
                    hintStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
          ),
          Container(
            child: Divider(
              height: 5,
              thickness: 3,
              // indent: 20,
              endIndent: 0,
              color: Color(bar_color),
            ),
          )
        ],
      ),
    );
  }
}
