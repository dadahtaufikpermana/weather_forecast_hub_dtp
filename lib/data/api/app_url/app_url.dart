import 'api_key.dart';

String weatherAppUrl(var latitude, var longitude){
  String url;

  url =
      'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
  return url;
}
