import 'package:flutter/material.dart';
import 'package:petpointer/components/constants.dart';
import 'package:petpointer/components/socialMediaSignUpBtn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petpointer/components/leadingIcon.dart';


class SignUpScreen extends StatefulWidget {
  static String id = "SignUp_Screen";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //========================

  //=======================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        elevation: 0,
        leading: LeadingIcon(
          icon: FontAwesomeIcons.chevronLeft,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 17, left: 33, bottom: 23),
            child: Text("Sign up", style: kSignUpBannerTxtStyle),
          ),
          SocialMediaSignUpBtn(
              onPressed: () {},
              bgcolor: Color(0xFF4267B2),
              text: "Sign up With Facebook",
              icon: FontAwesomeIcons.facebookSquare),
          SocialMediaSignUpBtn(
            bgcolor: Color(0xFFDE4B39),
            text: "Sign up With Google",
            icon: FontAwesomeIcons.google,
            onPressed: () {},
          ),
          SocialMediaSignUpBtn(
            bgcolor: Color(0xFF434141),
            text: "Sign up With E-mail",
            icon: FontAwesomeIcons.solidEnvelope,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
