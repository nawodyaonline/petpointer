import 'package:geolocator/geolocator.dart';

class Location {
  double longitute;
  double latitute;

  Future<void> getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    longitute = position.longitude;
    latitute = position.latitude;
  }
}
