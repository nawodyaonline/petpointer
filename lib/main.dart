import 'package:flutter/material.dart';
import 'package:petpointer/screens/welcomeScreen.dart';
import 'package:petpointer/screens/signUpScreen.dart';
import 'package:petpointer/screens/finderScreen.dart';
import 'package:petpointer/screens/testScreen.dart';
import 'package:petpointer/screens/mapSceen.dart';
import 'package:petpointer/screens/loadingScreen.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        LoadingScreen.id: (context) => LoadingScreen(),
        MapScreen.id: (context) => MapScreen(),
        TestScreen.id: (context) => TestScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        FinderScreen.id: (context) => FinderScreen()
      },
    ),
  );
}
