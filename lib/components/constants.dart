import 'package:flutter/material.dart';

const kBgColor = Color(0xFFF3F8FC);
const kLogoColor = Color(0xFF4A504A);

const kBtnColor = Color(0xFF434141);
const kBtnBgColor = Color(0xFFDBDEE1);

const kGreetingTxtStyle = TextStyle(
    fontSize: 45,
    color: Color(0xFF90A4AE),
    fontFamily: "Poppins",
    fontWeight: FontWeight.bold);

const kUsrTxtStyle = TextStyle(
  fontSize: 40,
  fontFamily: "Chivo",
  color: Color(0xFF3b434a),
);

const kLocationTxtStyle = TextStyle(
    color: Color(0xFF48494a),
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: "Chivo");

const kWeatherEmojiStyle = TextStyle(fontSize: 60);

const kSignUpBannerTxtStyle = TextStyle(
    fontSize: 42,
    color: kLogoColor,
    fontWeight: FontWeight.bold,
    fontFamily: "Poppins");

const kTempTxtStyle = TextStyle(
    fontSize: 43,
    color: Color(0xFF263238),
    fontFamily: "MuseoModerno",
    fontWeight: FontWeight.bold);

const kSMediaSignUpBtnTxtStyle = TextStyle(
  fontSize: 23,
  fontWeight: FontWeight.w600,
  color: Color(0xFFFFFFFF),
);

const kSignUpLinkTxtStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "Poppins");

const kGetStartBtnTxtStyle = TextStyle(
    fontSize: 26, fontFamily: "Poppins", letterSpacing: 0.5, color: kBtnColor);

const kLogoTxtColor = TextStyle(
  fontFamily: "Pangolin",
  fontWeight: FontWeight.w700,
  letterSpacing: 0.4,
  fontSize: 50,
  color: kLogoColor,
  shadows: <Shadow>[
    Shadow(
      offset: Offset(0.0, 3.0),
      blurRadius: 60.0,
      color: Color(0xFFE0E0E0),
    ),
  ],
);

const openWeatherMapURL = "https://api.openweathermap.org/data/2.5/weather";
const apiKey = "4a7bfc705566bc327f707d3934351b02";
