import 'package:geocoding/geocoding.dart';

class GeocodingService {
  Future<List<Placemark>> getLocationInfo(double latitude, double longitude) async {
    return await placemarkFromCoordinates(latitude, longitude);
  }
}
