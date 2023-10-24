import 'package:primary_school/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';

class WeatherRepository {
  WeatherRepository(this._weatherRemoteDataSource);
  final WeatherRemoteDataSource _weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final json = await _weatherRemoteDataSource.getWeatherData(city: city);
    if (json == null) {
      return null;
    }
    return WeatherModel.fromJson(json);
  }
}
