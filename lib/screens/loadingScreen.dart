import 'package:flutter/material.dart';
import 'package:petpointer/components/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:petpointer/services/weather.dart';
import 'package:petpointer/screens/finderScreen.dart';

class LoadingScreen extends StatefulWidget {
  static String id = "Loading_Screen";
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<dynamic> getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weather = await weatherModel.getLocationData();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return FinderScreen(mapData: weather);
        },
      ),
    );
  }

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Center(
        child: SpinKitDualRing(
          color: kBgColor,
          size: 25,
        ),
      ),
    );
  }
}
