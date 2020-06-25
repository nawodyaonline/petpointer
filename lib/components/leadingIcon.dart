import 'package:flutter/material.dart';
import 'package:petpointer/components/constants.dart';

class LeadingIcon extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  LeadingIcon({@required this.icon, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14, left: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          size: 35,
          color: kLogoColor,
        ),
      ),
    );
  }
}
