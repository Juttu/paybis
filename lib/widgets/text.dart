import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final double fontsize;
  final String text;
  // bool m;
  int color;
  TextWidget(
      {Key? key, required this.fontsize, required this.text,this.color=0xffffffff})
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
