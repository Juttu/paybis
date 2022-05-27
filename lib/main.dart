import 'package:flutter/material.dart';
import 'package:ui/screens/dynamic.dart';
import 'package:ui/screens/homescreen.dart';
import 'package:ui/screens/verification.dart';
import 'package:ui/screens/fur.dart';
import 'package:ui/screens/allbuttons.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: All(),


      
    );
  }
}