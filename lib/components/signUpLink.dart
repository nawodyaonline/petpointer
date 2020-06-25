import 'package:flutter/material.dart';
import 'package:petpointer/components/constants.dart';

class SignUpLink extends StatelessWidget {
  final Function onTap;
  SignUpLink({@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          child: Text(
            "Sign Up",
            style: kSignUpLinkTxtStyle,
          ),
        ),
      ),
    );
  }
}
