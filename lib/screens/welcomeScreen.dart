import 'package:flutter/material.dart';
import 'package:petpointer/components/titleLogo.dart';
import 'package:petpointer/components/constants.dart';
import 'package:petpointer/components/roundedButton.dart';
import 'package:petpointer/components/signUpLink.dart';
import 'package:petpointer/screens/finderScreen.dart';
import 'package:petpointer/screens/loadingScreen.dart';
import 'package:petpointer/screens/signUpScreen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "Welcome_Screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: TitleLogo(),
            ),
            Image.asset(
              "assets/welocomeImage.png",
              width: MediaQuery.of(context).size.width / 1.2,
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  RoundedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, LoadingScreen.id);
                    },
                  ),
                  SignUpLink(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpScreen.id);
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 5,)
          ],
        ),
      ),
    );
  }
}
