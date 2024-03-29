import 'package:primary_school/data/remote_data_sources_api/weather_remote_data_source.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';



class WeatherRepository {
  WeatherRepository({required this.weatherRemoteDataSource});
  final WeatherRemoteRetrofitDataSource weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
     return   weatherRemoteDataSource.getCurrentWeather(city);
   
   
  }
}
