import 'package:flutter/material.dart';
import 'package:petpointer/components/constants.dart';

class SocialMediaSignUpBtn extends StatelessWidget {
  final Color bgcolor;
  final String text;
  final IconData icon;
  final Function onPressed;
  SocialMediaSignUpBtn(
      {@required this.bgcolor,
      @required this.text,
      @required this.icon,
      this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        color: bgcolor,
        onPressed: onPressed,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 17, 13),
              child: Icon(
                icon,
                color: Color(0xFFFFFFFF),
                size: 29,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(text, style: kSMediaSignUpBtnTxtStyle),
            )
          ],
        ),
      ),
    );
  }
}
