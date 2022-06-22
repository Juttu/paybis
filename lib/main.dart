import 'package:google_fonts/google_fonts.dart';
import 'package:payBISUI/screens/login.dart';
import 'package:payBISUI/screens/pay_page.dart';
import 'package:payBISUI/screens/payui.dart';
import 'package:payBISUI/screens/split_slide.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.lexendTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
