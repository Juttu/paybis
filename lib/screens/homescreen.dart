import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ui/models/recommended_model.dart';
import 'package:ui/models/popular_model.dart';

import 'package:ui/screens/verification.dart';
import 'package:ui/data/data.dart';
import 'package:ui/models/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final _pageController = PageController(viewportFraction: 0.877);

  List<DynamicWidget> listDynamic = [];
  int i = 0;
  addDynamic() {
    listDynamic.add(DynamicWidget());
    print(listDynamic);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                height: 57.6,
                margin: EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //Custom Navigation Drawer and Search Button
                      Container(
                        height: 57.6,
                        width: 57.6,
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0x080a0928),
                        ),
                        child: SvgPicture.asset('assets/svg/icon_drawer.svg'),
                      ),
                      Container(
                        height: 57.6,
                        width: 57.6,
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0x080a0928),
                        ),
                        child: SvgPicture.asset('assets/svg/icon_search.svg'),
                      ),
                    ]),
              ),
              Container(
                margin: EdgeInsets.only(top: 50, left: 35, right: 28.8),
                child: Text(
                  "Explore\nthe Nature",
                  style: GoogleFonts.playfairDisplay(
                      fontSize: 45.6, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                height: 218.4,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    recommendations.length,
                    (int index) => Container(
                      margin: EdgeInsets.only(right: 28.8),
                      width: 333.6,
                      height: 218.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(recommendations[index].image),
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                              bottom: 19.2,
                              left: 19.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.8),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaY: 19.2, sigmaX: 19.2),
                                  child: Container(
                                    height: 36,
                                    padding: EdgeInsets.only(
                                        left: 16.72, right: 14.4),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        SvgPicture.asset(
                                            'assets/svg/icon_location.svg'),
                                        SizedBox(width: 9.54),
                                        Text(
                                          recommendations[index].name,
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 16.8),
                                        )
                                      ],
                                    ),
                                  ),
                                ), //BlurrEffect
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 28.8, top: 28.8),
                // color: Colors.red,///BGBGBGBGBGBg
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: recommendations.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Color(0xFF8a8a8a),
                    dotHeight: 6,
                    dotWidth: 6,
                    activeDotColor: Color(0xFFababab),
                  ),
                ),
              ),
              SlideWidget(),
              Container(
                // color: Colors.amber[400],
                margin: EdgeInsets.only(top: 33.6),
                height: 45.6,
                child: ListView.builder(
                  itemCount: populars.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 28.8, right: 9.6),
                  itemBuilder: (context, index) {
                    return Container(
                      // color: Colors.red[400],

                      margin: EdgeInsets.only(right: 19.6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xFFFEF1ED)),
                      child: Row(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(4),
                              margin: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(40),
                                color: Color(0xFF42A5F5),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(populars[index].image)),
                          Text("data"),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    for (var j = 0; j < listDynamic.length; j++) SlideWidget()
                  ],
                ),
              ),
              FloatingActionButton(
                onPressed: addDynamic,
                child: Icon(Icons.add),
              ),
              Container(
                color: Colors.red,
                child: TestWidget(usr: userdata[0]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  final User usr;
  const TestWidget({Key? key, required this.usr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("${usr.name}"),
    );
  }
}

class SlideWidget extends StatelessWidget {
  const SlideWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow[300],
      margin: EdgeInsets.only(top: 33.6),
      height: 45.6,

      // padding: EdgeInsets.only(left:70 ),
      child: ListView.builder(
        itemCount: recommendations.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 28.8, right: 9.6),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 22),
            // height: 600,
            // width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Color(0xFFFEF1ED)),
            child: Row(children: <Widget>[
              Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.orange.shade300,
                      borderRadius: BorderRadius.circular(40)),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.orange.shade100,
                  )),
              SizedBox(width: 20),
              Text(recommendations[index].name)
            ]),
          );
        },
      ),
    );
  }
}

class DynamicWidget extends StatelessWidget {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(8.0),
      child: new TextField(
        controller: controller,
        decoration: new InputDecoration(hintText: 'Enter Data '),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Its a button"),
    );
  }
}

Widget btn(String str) {
  return Container(
    child: Text("${str}"),
  );
}
