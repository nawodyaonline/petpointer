import 'package:flutter/material.dart';
import 'package:petpointer/components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petpointer/components/leadingIcon.dart';
import 'package:petpointer/screens/mapSceen.dart';
import 'package:petpointer/services/time.dart';

class FinderScreen extends StatefulWidget {
  final dynamic mapData;
  FinderScreen({this.mapData});
  static String id = "Finder_Screen";
  @override
  _FinderScreenState createState() => _FinderScreenState();
}

class _FinderScreenState extends State<FinderScreen> {
  int temperature;
  var condition;
  var cityName;
  var weatherIcon;

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  void updateUI() {
    if (widget.mapData == null) {
      print("Error");
    } else {
      setState(() {
        var temp = widget.mapData["main"]["temp"];
        temperature = temp.toInt();
        condition = widget.mapData["weather"][0]["id"];
        cityName = widget.mapData["name"];
        weatherIcon = getWeatherIcon(condition);
      });
    }
  }

  String greet;
  @override
  void initState() {
    setState(() {
      NowTime nowTime = NowTime();
      greet = nowTime.getTimeGreeting();
      updateUI();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        elevation: 0,
        leading: LeadingIcon(icon: FontAwesomeIcons.bars),
      ),
      body: Column(
        children: <Widget>[
          Card(
            color: Color(0xFFebf6ff),
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 19, vertical: 9),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(greet, style: kGreetingTxtStyle),
                  Text("Nayana", style: kUsrTxtStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "$weatherIcon",
                        style: kWeatherEmojiStyle,
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.locationArrow,
                              color: Color(0xFFE57373),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              cityName.toString(),
                              style: kLocationTxtStyle,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "$temperature°C",
                        style: kTempTxtStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 19),
                child: CircleAvatar(
                  radius: 37,
                  backgroundImage: NetworkImage(
                      "https://pbs.twimg.com/profile_images/1215056942575636480/TpXSkmV-_400x400.jpg"),
                ),
              ),
              
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, MapScreen.id);
            },
            child: Padding(
              padding:EdgeInsets.only(top: 70),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(4.0, 5.0),
                      blurRadius: 2,
                    ),
                  ],
                  color: Color(0xffd3daf5),
                  border: Border.all(
                    width: 5,
                    color: Color(0xffb4b9cf),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: Icon(
                  Icons.location_on,
                  color: Color(0xff1c1b1c),
                  size: 70,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
