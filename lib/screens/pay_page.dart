import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui/widgets/widgets.dart';
import 'package:ui/widgets/usericon.dart';
import 'package:aesthetic_dialogs/aesthetic_dialogs.dart';
import 'package:intl/intl.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:ui/screens/main_paypage.dart';
import 'package:ui/test_screens/slide.dart';

class Pay extends StatefulWidget {
  const Pay({Key? key}) : super(key: key);

  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  bool status = false;
  bool val = false;
  final double tabBarHeight = 10;
  PanelController _pc1 = new PanelController();

  @override
  Widget build(BuildContext context) {
    bool value = false;
    return Scaffold(
      backgroundColor: Color(0xff1c1c1e),
      body: SlidingUpPanel(
        onPanelClosed: () {
          print("closed");
          setState(() {
            val = false;
            status = val;
          });
        },
        controller: _pc1,
        minHeight: 0,
        maxHeight: 800,
        color: Colors
            .transparent, 
        panel: Container(
          decoration: BoxDecoration(
            // background color of panel
            color: Colors.white,
            // rounded corners of panel
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BarIndicator(),
              Expanded(
                child: SlideWidget(),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                // color: Colors.red,
                height: 57.6,
                margin: EdgeInsets.only(top: 18, left: 28.8, right: 28.8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //Custom Navigation Drawer and Search Button
                      Container(
                        height: 45,
                        width: 45,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: SvgPicture.asset('/Users/juttugajendraanurag/Desktop/ui/assets/svg/back_icon.svg'),
                      ),
                    ]),
              ),
              Container(
                height: 88,

                // color: Colors.red,
                margin: EdgeInsets.only(right: 50, left: 80),
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      UserIcon(
                          name: "Juttu",
                          iconimage: "/Users/juttugajendraanurag/Desktop/ui/assets/images/user_image1.png"),
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
                          iconimage: "/Users/juttugajendraanurag/Desktop/ui/assets/images/user_image2.jpeg"),
                    ]),
              ),
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 75, left: 77, right: 80),
                // color: Colors.grey[200],
                child: TextBox(hint: "0", icon: 0),
              ),
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 24, left: 77, right: 80),
                // color: Colors.grey[200],
                child: TextBox(hint: "For ?", icon: 1),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // color: Colors.amber,
                    margin: EdgeInsets.only(top: 40, left: 120, right: 100),
                    alignment: Alignment.center,
                    height: 32,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextWidget(fontsize: 24, text: "Split Bill ?"),
                          SizedBox(width: 18),
                          Expanded(
                            child: FlutterSwitch(
                              activeColor: Color(0xffF23467),
                              inactiveColor: Color(0xffE0E0E0),
                              activeText: "",
                              inactiveText: "",
                              inactiveTextColor: Colors.black,
                              valueFontSize: 10,
                              toggleSize: 30.0,
                              value: status,
                              borderRadius: 30.0,
                              padding: 2,
                              width: 400,
                              showOnOff: true,
                              onToggle: (val) {
                                setState(() {
                                  if (val) {
                                    print(val);
                                    _pc1.open();
                                  }

                                  status = val;
                                });
                              },
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 130, left: 12, right: 12),
                height: 100,
                alignment: Alignment.center,
                // color: Colors.white,
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: <Widget>[
                    Container(
                        width: 70,
                        margin: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Container(
                          height: 85,
                          width: 85,
                          alignment: Alignment.center,
                          child: Image.asset(
                            '/Users/juttugajendraanurag/Desktop/ui/assets/images/credit2.jpeg',
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 19, top: 30),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "payBIS Credit",
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(left: 30,top: 30),
                      // alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 30, bottom: 15),

                      // color: Colors.red,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.currency_rupee_outlined,
                            size: 20,
                            color: Colors.black,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "1000",
                              style: GoogleFonts.lato(
                                  fontSize: 20,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 12, right: 12),
                height: 58,
                alignment: Alignment.center,
                // color: Colors.white,
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12)),
                child:
                    TextWidget(fontsize: 25, text: "Send", color: 0xff000000),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSlidingPanel({
    required ScrollController scrollController,
  }) =>
      SlideWidget();
}

//  Container(
//               height: 40,
//               margin: EdgeInsets.only(top: 60, left: 10),
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 5,
//                   itemBuilder: (context, index) {
//                     return Cat();
//                   }),
//             ),
