import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_service/keyboard_service.dart';
import 'package:payBISUI/features/payearly/presentation/widgets/circular_slider.dart';
import 'package:payBISUI/widgets/widgets.dart';
import 'package:flutter/services.dart';
// import 'package:keyboard_service_example/app.dart';

double repay_amount = 1000;
int k = 0;
int h = 0;

class PayEarly extends StatefulWidget {
  const PayEarly({Key key}) : super(key: key);

  @override
  State<PayEarly> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<PayEarly> {
  double volume = repay_amount;
  bool liked = false;
  double currentAngle = math.pi * 2;

  void check() async {
    // KeyboardService.dismiss();
    await Future.delayed(Duration(seconds: 1));
    k = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("ontap");
        k = 1;
        check();
      },
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: Column(
              children: [
                SizedBox(height: 50),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back,
                      size: 35,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  child: Lexend(
                    fontweight: 1,
                    fontsize: 28,
                    text: "Choose Amount",
                    color: 0xff000000,
                  ),
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 340.0,
                      width: MediaQuery.of(context).size.width,
                      child: CircularSlider(
                        key: circularsliderstate,
                        onAngleChanged: (angle) {
                          volume = ((angle / (math.pi * 2)) * repay_amount);
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 130),
                        child: _VolumeRow(volume: volume)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VolumeRow extends StatefulWidget {
  final double volume;

  _VolumeRow({Key key, this.volume}) : super(key: key);

  @override
  State<_VolumeRow> createState() => _VolumeRowState();
}

class _VolumeRowState extends State<_VolumeRow> {
  final myController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (k == 0) {
      myController.text = "${widget.volume.ceil()}";
    }

    return Column(
      children: [
        Container(
          height: 80,
          width: 170,
          decoration: BoxDecoration(
            color: Color(0xff2C2C2E),
            borderRadius: BorderRadius.all(Radius.circular(11.0)),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 2),
                width: 30,
                height: 60,
                child: Icon(
                  Icons.currency_rupee_outlined,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(width: 2),
              VerticalDivider(
                color: Color(0xff525252),
                indent: 10,
                endIndent: 10,
                thickness: 0.5,
              ),
              SizedBox(width: 2),
              Container(
                width: 116,
                child: TextField(
                  autofocus: true,
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: myController,
                  cursorColor: Colors.white,
                  style: GoogleFonts.lexend(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(5),
                  ],
                  onChanged: (d) {
                    try {
                      circularsliderstate.currentState.setstate_fun_circular(d);
                    } catch (e) {}
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          child: Lexend(
            fontweight: 0,
            fontsize: 20,
            text: "of ${repay_amount.ceil()}",
            color: 0xff8E8E93,
          ),
        ),
      ],
    );
  }
}
