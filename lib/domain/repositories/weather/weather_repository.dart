import 'package:primary_school/domain/models/weather_model/weather_model.dart';

class WeatherRepository {
  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    return WeatherModel(
      city: 'Kalrino',
      temperature: 12,
    );
  }
}
