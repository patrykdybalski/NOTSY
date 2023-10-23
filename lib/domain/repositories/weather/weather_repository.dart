import 'package:dio/dio.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';

class WeatherRepository {
  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    //
    final response = await Dio().get<Map<String, dynamic>>(
        'http://api.weatherapi.com/v1/current.json?key=9518138900ee4740ad9193115230506&q=$city&aqi=no');
    final responseData = response.data;
    if (responseData == null) {
      return null;
    }

    final name = responseData['location']['name'] as String;
    final country = responseData['location']['country'] as String;
    final temperature = (responseData['current']['temp_c'] + 0.0) as double;
    final wind = (responseData['wind_mph'] + 0.0) as double;
    final rain = (responseData['percip_mm'] + 0.0) as double;
    final barometr = (responseData['pressure_mb'] + 0.0) as double;
    final humidity = (responseData['humidity'] + 0.0) as double;

    return WeatherModel(
      city: name,
      country: country,
      temperature: temperature,
      wind: wind,
      rain: rain,
      barometr: barometr,
      humidity: humidity,
    );
  }
}
