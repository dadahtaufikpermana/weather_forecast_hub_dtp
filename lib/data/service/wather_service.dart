import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_forecast_hub_dtp/data/api/app_url/api_key.dart';

class WeatherService {
  final String apiKey;

  WeatherService({required this.apiKey});

  Future<Map<String, dynamic>> getWeather(double latitude, double longitude) async {
    final url = 'http://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      print('Weather API Response: $data');
      return data;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
