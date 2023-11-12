import 'package:dio/dio.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_remote_data_source.g.dart';

@RestApi(baseUrl: 'http://api.weatherapi.com/v1/')
abstract class WeatherRemoteRetrofitDataSource {
  factory WeatherRemoteRetrofitDataSource(Dio dio, {String baseUrl}) = _WeatherRemoteRetrofitDataSource;

   @GET('/current.json?key=9518138900ee4740ad9193115230506&aqi=no')
  Future<WeatherModel> getCurrentWeather(@Query('q') String city);
}





// first code in DataSource
// class WeatherRemoteDataSource {
//   Future<Map<String, dynamic>?> getWeatherData({
//     required String city,
//   }) async {
//     try {
//       final response = await Dio().get<Map<String, dynamic>>(
//         'http://api.weatherapi.com/v1/current.json?key=9518138900ee4740ad9193115230506&q=$city&aqi=no',
//       );

//       return response.data;
//     } on DioException catch (error) {
//       throw Exception(
//         error.response?.data['error']['message'] ?? 'Unknwon error',
//       );
//     }
//   }
// }
 