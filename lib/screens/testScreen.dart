import 'package:flutter/material.dart';
import 'package:petpointer/services/weather.dart';

class TestScreen extends StatefulWidget {
  static String id = "Test_Screen";
  @override
  _TestScreenState createState() => _TestScreenState();
}

void getCLocationWeather() async {
  WeatherModel weatherModel = WeatherModel();
  await weatherModel.getLocationData();
  print(weatherModel);
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FlatButton(
            onPressed: () {
              getCLocationWeather();
            },
            child: Text("Locate me")),
      ),
    );
  }
}
