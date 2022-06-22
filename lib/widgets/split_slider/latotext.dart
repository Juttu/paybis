import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LatoText extends StatelessWidget {
  final name;
  const LatoText({
    Key key, this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(top: 18),
        // color: Colors.amber,
        height: 25,
        child: Padding(
          padding: EdgeInsets.only(left: 19),
          child: Text(
            name,
            style: GoogleFonts.lato(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ));
  }
}
