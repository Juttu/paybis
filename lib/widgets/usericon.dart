import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserIcon extends StatelessWidget {
  final String name;
  final String iconimage;

  const UserIcon({Key key,  this.name,  this.iconimage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: 88,

      // color: Colors.black,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.grey[200],
              backgroundImage: AssetImage(
                iconimage,
              ),
              // child: SvgPicture.asset('assets/svg/user_image.svg'),
            ),
            Text(
              name,
              style: GoogleFonts.lato(fontSize: 18, color: Color(0xffffffff)),
            )
          ]),
    );
  }
}
