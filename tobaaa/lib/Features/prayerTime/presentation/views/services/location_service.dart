import 'package:adhan/adhan.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<PrayerTimes> getPrayerTimes() async {
    var params = CalculationMethod.egyptian.getParameters();

    try {
      Position position = await determinePosition();

      final myCoordinates = Coordinates(position.latitude,
          position.longitude); // Replace with your own location lat, lng.
      params.madhab = Madhab.shafi;
      return PrayerTimes.today(myCoordinates, params);
    } on Exception catch (e) {
      // TODO
      print(e);
      return PrayerTimes.today(Coordinates(30.033333, 31.233334), params);
    }
  }

  Future<Position> determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
