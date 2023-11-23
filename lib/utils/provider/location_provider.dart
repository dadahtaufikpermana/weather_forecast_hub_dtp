import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  bool _isLoading = true;
  double _latitude = 0.0;
  double _longitude = 0.0;

  bool get isLoading => _isLoading;
  double get latitude => _latitude;
  double get longitude => _longitude;

  Future<void> getLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        permission = await Geolocator.requestPermission();
        // Umpan balik jika layanan lokasi dinonaktifkan
        throw Exception('Layanan lokasi dinonaktifkan. Aktifkan GPS untuk melanjutkan.');
      }

      permission = await Geolocator.checkPermission();
      print('Status izin lokasi: $permission');

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        print('Meminta izin lokasi: $permission');
        if (permission == LocationPermission.denied) {
          throw Exception('Izin lokasi ditolak.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        throw Exception('Izin lokasi ditolak secara permanen. Aktifkan izin lokasi untuk melanjutkan.');
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      _latitude = position.latitude;
      _longitude = position.longitude;
      notifyListeners();
    } catch (e) {
      // Umpan balik jika terjadi kesalahan mendapatkan lokasi
      throw Exception('Error mendapatkan lokasi: $e');
    }
  }
}