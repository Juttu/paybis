import 'package:flutter/material.dart';
import 'package:ui/screens/main_paypage.dart';

class InsideWidget extends StatelessWidget {
  const InsideWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
         
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8)),
            width: 52,
            height: 8,
            margin: EdgeInsets.only(top: 8),
            // color: Colors.red,
          ),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 6.0),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    // color: Colors.red,
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: Color(0xff5F6268),
                        borderRadius: BorderRadius.circular(12)),
                    width: 350,
                    height: 100,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 80,
                          padding: EdgeInsets.only(left: 12),
                          child: ClipRRect(
                            child: Image.asset(
                                '/Users/juttugajendraanurag/Desktop/ui/assets/images/avatar_img.png'),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
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
