import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payBISUI/components/contacts-list.dart';
import 'package:payBISUI/widgets/split_slider/latotext.dart';

import '../data/data.dart';

List recentitems = [];
GlobalKey<_RecentsWidgetState> textGlobalKey_recents =
    GlobalKey<_RecentsWidgetState>();

class RecentsWidget extends StatefulWidget {
  final Function callback1;
  final Stream<int> stream;
  RecentsWidget({Key key, this.callback1, this.stream}) : super(key: key);

  @override
  State<RecentsWidget> createState() => _RecentsWidgetState();
}

class _RecentsWidgetState extends State<RecentsWidget> {
  bool selected = false;

  @override
  void initState() {
    super.initState();
    addtolist_recents(recents);
    
  }

  void recentwidget_setstate() {
    // print("RECENTWIDGET");
    setState(() {});
  }

  int count = 0;
  addtolist_recents(recents) {
    List _recentitems = [];
    recents.forEach((element) {
      try {
        // print(element.name);
        var obj1 = {
          "id": count,
          "name": element.name,
          "contact": element.contact,
          "imageurl": element.imageUrl,
          "value": false
        };
        count++;
        _recentitems.add(obj1);
      } catch (e) {
        print(e);
      }
    });
    setState(() {
      recentitems = _recentitems;
      // print(recentitems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        children: [
          LatoText(name: "Recent"),
          Container(
            margin: EdgeInsets.only(top: 15, left: 15),
            color: Colors.white,
            height: 109,
            width: double.maxFinite,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recentitems.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    // height: 95,
                    width: 70,
                    // color: Colors.blue,
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              (recentitems[index]["value"] == false)
                                  ? addSplit(recents[index].name,
                                      recents[index].imageUrl)
                                  : deleteSplit(recents[index].name);
                            },
                            child: (recentitems[index]["value"] == false)
                                ? CircleWidget(
                                    index: index,
                                    outer_radius: 28,
                                  )
                                : CircleWidget(
                                    index: index,
                                    outer_radius: 33,
                                  )),
                        SizedBox(height: 8),
                        Container(
                          // color: Colors.purple,
                          width: 60,
                          height: 19,
                          padding: EdgeInsets.only(left: 14),
                          child: Text(
                            recentitems[index]["name"],
                            style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}



class CircleWidget extends StatelessWidget {
  final int index;
  final double outer_radius;

  const CircleWidget({Key key, this.index, this.outer_radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.pink,
      radius: outer_radius,
      child: CircleAvatar(
        radius: 28,
        child: ClipRRect(
          child: Image.asset(recentitems[index]["imageurl"]),
          borderRadius: BorderRadius.circular(90.0),
        ),
      ),
    );
  }
}
