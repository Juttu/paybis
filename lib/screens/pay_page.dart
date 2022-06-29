import 'package:payBISUI/screens/split_slide.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_switch/flutter_switch.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../widgets/text.dart';
import '../widgets/usericon.dart';
import '../widgets/textbox.dart';

import 'package:flutter/services.dart';

class Pay extends StatefulWidget {
  const Pay({Key key}) : super(key: key);

  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  bool status = false;
  bool val = false;
  final double tabBarHeight = 10;
  PanelController _pc1 = new PanelController();
  static const IconData arrow_back_ios_new_rounded =
      IconData(0xf570, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    bool value = false;
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: SlidingUpPanel(
        onPanelClosed: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');

          print("closed");
          setState(() {
            val = false;
            status = val;
          });
        },
        controller: _pc1,
        minHeight: 0,
        maxHeight: 800,
        color: Colors.transparent,
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
                child: SplitSlide(),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 88,
                    // color: Colors.amber,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: IconButton(
                            iconSize: 35,
                            color: Colors.white,
                            icon: Icon(arrow_back_ios_new_rounded),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25),
                          // color: Colors.white,
                          child: UserIcon(
                              name: "Juttu",
                              iconimage:
                                  "/Users/juttugajendraanurag/Desktop/ui/assets/images/cartoon5.jpeg"),
                        ),
                        Container(
                          // color: Colors.amber,
                          margin: EdgeInsets.only(bottom: 30),
                          padding: EdgeInsets.all(12),
                          child: Image.asset(
                            '/Users/juttugajendraanurag/Desktop/ui/assets/images/arrow_front.png',
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 29),
                          child: UserIcon(
                              name: "Canteen",
                              iconimage:
                                  "/Users/juttugajendraanurag/Desktop/ui/assets/images/cartoon9.png"),
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
                  SizedBox(height: 35),
                  Container(
                    margin: EdgeInsets.only(top: 28, left: 59, right: 59),
                    height: 260,
                    width: 299,
                    // color: Colors.amber,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff1C1C1E), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      color: Color(0xff101010),
                    ),
                    child: Column(children: [
                      Container(
                        height: 55,
                        margin: EdgeInsets.only(left: 18, top: 30, right: 22),
                        child: TextBox(hint: "0", icon: 0, inputType: false),
                      ),
                      Container(
                        height: 55,
                        margin: EdgeInsets.only(top: 26, left: 18, right: 22),
                        // color: Colors.grey[200],
                        child: TextBox(hint: "For ?", icon: 1, inputType: true),
                      ),
                      Container(
                        // color: Colors.amber,
                        margin: EdgeInsets.only(top: 30),
                        alignment: Alignment.center,
                        // height: 32,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextWidget(fontsize: 24, text: "Split Bill ?"),
                              SizedBox(width: 18),
                              Container(
                                width: 55,
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
                                    SystemChannels.textInput
                                        .invokeMethod('TextInput.hide');

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
                    ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    color: Color(0xff525252),
                    height: 0.5,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 1),
                    height: 60,
                    // color: Colors.amber,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 42,
                          width: 122,
                          margin: EdgeInsets.only(left: 11),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            color: Color(0xffffffff),
                          ),
                          child: Text(
                            "Credit",
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        VerticalDivider(
                          color: Color(0xff525252),
                          thickness: 0.5,
                          indent: 9,
                          endIndent: 9,
                        ),
                        SizedBox(width: 5),
                        Container(
                          alignment: Alignment.center,
                          height: 42,
                          width: 220,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            color: Color(0xffF54278),
                          ),
                          child: Text(
                            "Pay",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                    child: TextWidget(
                        fontsize: 25, text: "Send", color: 0xff000000),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  // Widget buildSlidingPanel({
  //    ScrollController scrollController,
  // }) =>
  //     SliderContent();
}

class BarIndicator extends StatelessWidget {
  const BarIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: 71,
      child: Column(
        children: <Widget>[
          SizedBox(height: 8),
          Container(
              // color: Colors.red,
              // margin: EdgeInsets.only(left:162,bottom: 35),
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              )),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            // color: Colors.red,
            height: 45,
            child: Text(
              'With Friends...',
              style: GoogleFonts.lexend(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            child: Divider(
              height: 5,
              thickness: 2,
              // indent: 20,
              endIndent: 0,
              color: Color(0xffEBEBEC),
            ),
          )
        ],
      ),
    );
  }
}
