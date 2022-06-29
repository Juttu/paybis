import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final double fontsize;
  final String text;
  // bool m;
  int color;
  TextWidget({Key key, this.fontsize, this.text, this.color = 0xffffffff})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // int b = m ? 0xff000000 : 0xffffffff;
    // print(b);

    return Container(
      child: Text(
        text,
        style: GoogleFonts.lato(fontSize: fontsize, color: Color(color)),
      ),
    );
  }
}

class Lexend extends StatelessWidget {
  final double fontsize;
  final String text;
  int color;
  int fontweight;
  Lexend({Key key, this.fontsize, this.text, this.color,@required this.fontweight}) : super(key: key);

  List<FontWeight> _fontweight = [FontWeight.w500, FontWeight.w700,FontWeight.w400,FontWeight.w600];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: GoogleFonts.lexend(
            fontSize: fontsize,
            color: Color(color),
            fontWeight: _fontweight[fontweight]),
      ),
    );
  }
}
