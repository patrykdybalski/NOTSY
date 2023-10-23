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
    final cloudy = (responseData['current']['cloud'] + 0.0) as double;
    final direction = responseData['current']['wind_dir'] as String;
    final wind = (responseData['current']['wind_mph'] + 0.0) as double;
    final rain = (responseData['current']['precip_mm'] + 0.0) as double;
    final barometr = (responseData['current']['pressure_mb'] + 0.0) as double;
    final humidity = (responseData['current']['humidity'] + 0.0) as double;
    final text = responseData['current']['condition']['text'] as String;

    return WeatherModel(
      name: name,
      country: country,
      temperature: temperature,
      direction: direction,
      cloudy: cloudy,
      wind: wind,
      rain: rain,
      barometr: barometr,
      humidity: humidity,
      text: text,
    );
  }
}
