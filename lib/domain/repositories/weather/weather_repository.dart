import 'package:dio/dio.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';

class WeatherRepository {
  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    //
    final response = await Dio().get(
        'http://api.weatherapi.com/v1/current.json?key=9518138900ee4740ad9193115230506&q=Karlino&aqi=no');

    return WeatherModel(
      city: 'Karlino',
      temperature: 12,
    );
  }
}
