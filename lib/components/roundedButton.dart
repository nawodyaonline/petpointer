import 'package:flutter/material.dart';
import 'package:petpointer/components/constants.dart';

class RoundedButton extends StatelessWidget {
  final Function onPressed;
  RoundedButton({@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: kBtnBgColor,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Text(
          "Get Start",
          style: kGetStartBtnTxtStyle,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(38.5),
        side: BorderSide(color: kBtnColor, width: 4),
      ),
    );
  }
}
