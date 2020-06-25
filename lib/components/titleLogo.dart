import 'package:flutter/material.dart';
import 'package:petpointer/components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class TitleLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Transform.rotate(
            angle: 346.95 * pi / 180,
            child: Icon(
              FontAwesomeIcons.paw,
              color: kLogoColor,
              size: 55,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text("Pet Pointer", style: kLogoTxtColor)
        ],
      ),
    );
  }
}
