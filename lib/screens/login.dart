import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payBISUI/features/home/presentation/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff080808),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 343.3,
                width: double.infinity,
                child: FittedBox(
                  child: Hero(
                      tag: 1,
                      child: Image.asset(
                        'assets/images/credit1.jpg',
                        // color: Colors.amber,
                      )),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 58),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'India\’s #1 ',
                          style: GoogleFonts.lexend(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'Student',
                          style: GoogleFonts.lexend(
                            color: Color(0xffD81A4C),
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text("Credit Card and Crypto App",
                      style: GoogleFonts.lexend(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ))),
              Container(
                // color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 61),
                      color: Color(0xff525252),
                      height: 0.5,
                      width: 100,
                    ),
                    SizedBox(width: 14),
                    Container(
                        margin: EdgeInsets.only(top: 64),
                        child: Text("Login or Signup",
                            style: GoogleFonts.lexend(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ))),
                    SizedBox(width: 14),
                    Container(
                      margin: EdgeInsets.only(top: 61),
                      color: Color(0xff525252),
                      height: 0.5,
                      width: 100,
                    )
                  ],
                ),
              ),
              SizedBox(height: 27),
              Container(
                width: 320,
                height: 43.73,
                child: SignInButton(
                  Buttons.Google,
                  text: "Continue with Google",
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(90)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
