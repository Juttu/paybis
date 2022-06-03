import 'package:flutter/material.dart';
import 'package:ui/screens/main_paypage.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlideCheck extends StatefulWidget {
    // final ScrollController = controller;

  SlideCheck({Key? key}) : super(key: key);

  @override
  _SlideCheckState createState() => _SlideCheckState();
}

class _SlideCheckState extends State<SlideCheck> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        panel: ListView(
          // controller: controller,
          children: <Widget>[
            
            Container(
                color: Colors.amber,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Text("data");
                    }))
          ],
        ),
        body: Center(
          child: MainPayPage(),
        ),
      ),
    );
  }
}

// MainPayPage
