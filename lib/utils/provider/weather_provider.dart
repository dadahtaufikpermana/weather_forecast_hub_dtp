import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import '../../data/api/app_url/api_key.dart';
import '../../data/model/weather_forecast.dart';
import '../../data/service/wather_service.dart';

// WeatherProvider adalah kelas ChangeNotifier yang bertanggung jawab atas pengelolaan data terkait cuaca dan interaksi dengan data tersebut.
class WeatherProvider extends ChangeNotifier {
  bool _isLoading = true;

  // menyimpan Nilai latitude dan longitude untuk lokasi saat ini.
  double _latitude = 0.0;
  double _longitude = 0.0;

  // Menyimpan data perkiraan cuaca.
  WeatherForecast? _weatherData;

  // Menyimpan kondisi cuaca utama (misalnya, Cerah, Hujan).
  String _weatherMain = '';

  // Flag untuk menunjukkan apakah GPS sudah diaktifkan.
  bool _isGpsEnabled = false;

  // Flag untuk menunjukkan apakah data cuaca sudah diambil.
  bool _isDataFetched = false;

  // Menyimpan nama lokasi.
  String _locationName = '';

  // Getter untuk berbagai properti.
  String get locationName => _locationName;


  bool get isGpsEnabled => _isGpsEnabled;

  int get forecastLength => _weatherData?.weatherDataList.length ?? 0;

  // Fungsi untuk mengonversi suhu dari Kelvin ke Celsius.
  String temperature(int index) {
    if (_weatherData != null && index < _weatherData!.weatherDataList.length) {
      double kelvinTemperature =
          _weatherData!.weatherDataList[index].temperature ?? 0.0;
      double celsiusTemperature = kelvinTemperature - 273.15;
      return celsiusTemperature.toStringAsFixed(2);
    }
    return 'N/A';
  }

  // Fungsi untuk mendapatkan tanggal dan waktu yang diformat untuk indeks perkiraan tertentu.
  String getDateTime(int index) {
    DateTime now = DateTime.now().add(Duration(hours: 3 * index));
    String formattedDate = DateFormat('E, MMM d, y hh:mm a').format(now);
    return formattedDate;
  }

  // Fungsi untuk mendapatkan kondisi cuaca utama untuk indeks perkiraan tertentu.
  String getWeatherMainAtIndex(int index) {
    if (_weatherData != null && index < _weatherData!.weatherDataList.length) {
      return _weatherData!.weatherDataList[index].weatherMain;
    }
    return 'N/A';
  }

  // Fungsi untuk mengatur kondisi cuaca utama.
  void setWeatherMain(String value) {
    _weatherMain = value;
    notifyListeners();
  }

  // Fungsi untuk mendapatkan URL icon cuaca untuk indeks perkiraan tertentu.
  String getWeatherIconCode(int index) {
    if (_weatherData?.weatherDataList.isNotEmpty == true &&
        index < _weatherData!.weatherDataList.length) {
      String baseUrl = "https://openweathermap.org/img/wn/";
      String iconCode = _weatherData!.weatherDataList[index].weatherIcon;
      String iconUrl = '$baseUrl$iconCode';

      if (iconCode.endsWith('d')) {
        iconUrl += '@2x.png';
      } else {
        iconUrl += '.png';
      }

      return iconUrl;
    } else {
      return '';
    }
  }

  // Fungsi untuk mendapatkan data cuaca untuk indeks perkiraan tertentu.
  WeatherData? getWeatherDataAtIndex(int index) {
    if (_weatherData != null &&
        index >= 0 &&
        index < _weatherData!.weatherDataList.length) {
      return _weatherData!.weatherDataList[index];
    }
    return null;
  }

  // Fungsi untuk menginisialisasi data cuaca, termasuk memeriksa GPS dan mengambil lokasi serta cuaca.
  Future<void> initializeWeatherData() async {
    await checkGps();

    if (!isGpsEnabled) {
      bool permissionGranted = await requestLocationPermission();
      if (!permissionGranted) {
        while (!permissionGranted) {
          permissionGranted = await requestLocationPermission();
        }
      }
    }

    if (!_isDataFetched) {
      await getLocationAndFetchWeather();
    }
  }

  // Fungsi untuk mendapatkan lokasi dan mengambil data cuaca.
  Future<void> getLocationAndFetchWeather() async {
    try {
      if (_weatherData == null) {
        await getLocation();
        await getWeather();
        await getLocationName();
        _isDataFetched = true;
        notifyListeners();
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Fungsi untuk memeriksa apakah GPS sudah diaktifkan.
  Future<void> checkGps() async {
    _isGpsEnabled = await Geolocator.isLocationServiceEnabled();
    notifyListeners();
  }

  // Fungsi untuk meminta izin lokasi.
  Future<bool> requestLocationPermission() async {
    var status = await Geolocator.checkPermission();
    print('Status izin lokasi: $status');

    if (status == LocationPermission.denied) {
      status = await Geolocator.requestPermission();
      print('Meminta izin lokasi: $status');
      if (status == LocationPermission.denied) {
        return false;
      }
    }
    return true;
  }

  // Fungsi untuk mendapatkan nama lokasi menggunakan geocoding.
  Future<void> getLocationName() async {
    try {
      final placemarks = await placemarkFromCoordinates(_latitude, _longitude);

      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;
        final locationName = placemark.locality ?? '';
        _locationName = locationName;
        notifyListeners();
      }
    } catch (e) {
      print('Error mendapatkan nama lokasi: $e');
    }
  }

  // Fungsi untuk mendapatkan lokasi saat ini.
  Future<void> getLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      permission = await Geolocator.checkPermission();
      print('Status izin lokasi: $permission');

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        print('Meminta izin lokasi: $permission');
        if (permission == LocationPermission.denied) {
          return Future.error('Izin lokasi ditolak');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Izin lokasi ditolak secara permanen, kami tidak dapat meminta izin.');
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      _latitude = position.latitude;
      _longitude = position.longitude;
    } catch (e) {
      print('Error mendapatkan lokasi: $e');
    }
  }

  // Fungsi untuk mengambil data cuaca menggunakan WeatherService.
  Future<void> getWeather() async {
    try {
      final weatherData = await WeatherService(apiKey: apiKey).getWeather(
        _latitude,
        _longitude,
      );

      final weatherModel = WeatherForecast.fromJson(weatherData);
      setWeatherMain(weatherModel.weatherDataList[0].weatherMain);

      _weatherData = weatherModel;
      print('Data cuaca diambil dengan sukses');
      notifyListeners();
    } catch (e) {
      print('Error mengambil data cuaca: $e');
    }
  }
}
