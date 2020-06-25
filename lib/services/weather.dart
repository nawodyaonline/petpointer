import 'package:petpointer/services/networking.dart';
import 'package:petpointer/services/location.dart';
import 'package:petpointer/components/constants.dart';

class WeatherModel {
  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            "$openWeatherMapURL?lat=${location.latitute}&lon=${location.longitute}&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
