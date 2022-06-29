import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payBISUI/features/home/presentation/widgets/topbar.dart';
import 'package:payBISUI/features/payearly/presentation/payearly.dart';
import 'package:payBISUI/widgets/widgets.dart';

import '../../../screens/pay_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

bool visible = true;
int itemCount = 20;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff080808),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 40,
                  // color: Colors.amber,
                  child: TopBar(),
                ),
                SizedBox(height: 18),
                Container(
                  // margin: EdgeInsets.only(),
                  height: 219,
                  width: 358,
                  decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.all(Radius.circular(11.0)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 8, right: 8, top: 8),
                        height: 148,
                        width: 358,
                        decoration: BoxDecoration(
                          color: Color(0xffFFE7ED),
                          borderRadius: BorderRadius.all(Radius.circular(11.0)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 40, left: 65),
                              // color: Colors.amber,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.currency_rupee_outlined,
                                    size: 55,
                                  ),
                                  Container(
                                    // color: Colors.red,
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Lexend(
                                      text: "2000",
                                      fontsize: 55,
                                      color: 0xff000000,
                                      fontweight: 0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              // color: Colors.red,
                              margin: EdgeInsets.only(left: 22),
                              child: Lexend(
                                fontweight: 0,
                                fontsize: 16,
                                text: "left out of 5000",
                                color: 0xff8E8E93,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 56,
                        width: 358,
                        margin: EdgeInsets.only(top: 7),
                        decoration: BoxDecoration(
                          color: Color(0xff262629),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(11.0),
                              bottomRight: Radius.circular(11.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 24),
                                child: Lexend(
                                  text: "CREDIT",
                                  color: 0xffffffff,
                                  fontsize: 28,
                                  fontweight: 1,
                                )),
                            Container(
                              margin: EdgeInsets.only(left: 24),
                              child: Image.asset(
                                'assets/images/nfc.png',
                                color: Color(0xffD9D6CC),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 22),
                  color: Color(0xff1C1C1E),
                  width: double.infinity,
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(top: 17),
                      width: 364,
                      // color: Colors.redAccent,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                               Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Pay()),
                              );
                            },
                            child: Container(
                              height: 80,
                              width: 193,
                              decoration: BoxDecoration(
                                color: Color(0xff2C2C2E),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(11.0)),
                                    ),
                                    child: Container(
                                        margin: EdgeInsets.all(10),
                                        child: SvgPicture.asset(
                                            "assets/svg/qr1.svg")),
                                  ),
                                  SizedBox(width: 13),
                                  Lexend(
                                    fontweight: 1,
                                    text: "Scan & Pay",
                                    fontsize: 17,
                                    color: 0xffffffff,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 9),
                            height: 80,
                            width: 162,
                            decoration: BoxDecoration(
                              color: Color(0xff2C2C2E),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(90.0)),
                                  ),
                                  child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: Icon(
                                        Icons.arrow_upward_outlined,
                                        size: 40,
                                      )),
                                ),
                                SizedBox(width: 13),
                                Lexend(
                                  fontweight: 1,
                                  text: "UPI ID",
                                  fontsize: 17,
                                  color: 0xffffffff,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 13),
                      height: 79,
                      width: 364,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            // color: Colors.red,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 2),
                                  child: Lexend(
                                      fontweight: 1,
                                      text: "Payments",
                                      fontsize: 22,
                                      color: 0xff000000),
                                ),
                                SizedBox(height: 4),
                                Container(
                                  alignment: Alignment.center,
                                  height: 20,
                                  width: 169,
                                  decoration: BoxDecoration(
                                    color: Color(0xffF0F0F0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  child: Lexend(
                                    fontweight: 2,
                                    text: "Bill will be generated on July 1st.",
                                    fontsize: 10,
                                    color: 0xff3E3E3E,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 40),
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              height: 46,
                              width: 116,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                              ),
                              child: Lexend(
                                fontweight: 3,
                                text: "Pay Early",
                                fontsize: 17,
                                color: 0xffffffff,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PayEarly()),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: 364,
                      child: Lexend(
                          fontweight: 1,
                          fontsize: 22,
                          color: 0xffffffff,
                          text: "Recent Transactions"),
                    ),
                    SizedBox(height: 16),
                  ]),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        color: Color(0xff1C1C1E),
                        child: Container(
                          margin: EdgeInsets.only(left: 13, right: 13),
                          // width: 364,
                          decoration: BoxDecoration(
                            color: Color(0xff2C2C2E),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.only(top: 16, left: 16),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: Color(0xffffffff),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0)),
                                            ),
                                          ),
                                          SizedBox(width: 18),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Lexend(
                                                  fontweight: 3,
                                                  fontsize: 17,
                                                  color: 0xffffffff,
                                                  text: "Paid to canteen"),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Lexend(
                                                fontweight: 2,
                                                fontsize: 15,
                                                color: 0xff8B8B8B,
                                                text: "24 June 2022",
                                              )
                                            ],
                                          ),
                                          SizedBox(width: 68),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Lexend(
                                                  fontweight: 3,
                                                  fontsize: 17,
                                                  color: 0xffffffff,
                                                  text: "₹ 100"),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Lexend(
                                                fontweight: 2,
                                                fontsize: 15,
                                                color: 0xff3AFF66,
                                                text: "Done",
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Visibility(
                                        child: Container(
                                          margin: EdgeInsets.only(top: 16),
                                          color: Color(0xff525252),
                                          height:
                                              index == itemCount - 1 ? 0 : 0.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 150,
                  color: Color(0xff1C1C1E),
                )
              ]),
            ),
          ),
        ));
  }
}
