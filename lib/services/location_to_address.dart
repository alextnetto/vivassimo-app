import 'package:geocoding/geocoding.dart';

getAddress(lat, lon) async {
  List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
  return placemarks.first;
}
