import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:ui/screens/pay_page.dart';
import 'package:ui/screens/inside.dart';

class MainPayPage extends StatefulWidget {
  const MainPayPage({Key? key}) : super(key: key);

  @override
  _MainPayPageState createState() => _MainPayPageState();
}

class _MainPayPageState extends State<MainPayPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pay() , // AppBar,
    );
  }
}

      class Sp extends StatelessWidget {
        const Sp({ Key? key }) : super(key: key);
      
        @override
        Widget build(BuildContext context) {
          return SlidingUpPanel(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        maxHeight: 330,
        minHeight: 200,
        panel: InsideWidget(),
        // scrollController: scrollController,

        body: Pay(),
      );
        }
      }