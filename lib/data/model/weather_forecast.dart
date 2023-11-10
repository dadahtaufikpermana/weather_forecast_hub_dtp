class WeatherForecast {
  final List<WeatherData> weatherDataList;

  WeatherForecast({required this.weatherDataList});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    List<WeatherData> weatherDataList = [];
    if (json['list'] != null) {
      var list = json['list'] as List;
      weatherDataList = list.map((data) => WeatherData.fromJson(data)).toList();
    }
    return WeatherForecast(weatherDataList: weatherDataList);
  }
}

class WeatherData {
  final DateTime dateTime;
  final double temperature;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final String weatherMain;
  final String weatherDescription;
  final String weatherIcon;
  final int clouds;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final int visibility;
  final double pop;
  final double rain3h;

  WeatherData({
    required this.dateTime,
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.weatherMain,
    required this.weatherDescription,
    required this.weatherIcon,
    required this.clouds,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.visibility,
    required this.pop,
    required this.rain3h,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      temperature: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      tempMin: json['main']['temp_min'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      weatherMain: json['weather'][0]['main'],
      weatherDescription: json['weather'][0]['description'],
      weatherIcon: json['weather'][0]['icon'],
      clouds: json['clouds']['all'],
      windSpeed: json['wind']['speed'].toDouble(),
      windDeg: json['wind']['deg'],
      windGust: json['wind']['gust'].toDouble(),
      visibility: json['visibility'],
      pop: json['pop'].toDouble(),
      rain3h: json['rain'] != null ? json['rain']['3h'].toDouble() : 0.0,
    );
  }
}
