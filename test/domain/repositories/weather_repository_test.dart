import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_school/data/remote_data_sources_api/weather_remote_data_source.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';
import 'package:primary_school/domain/repositories/weather/weather_repository.dart';

class MockWeatherDataSource extends Mock
    implements WeatherRemoteRetrofitDataSource {}

void main() {
  late WeatherRepository sut; //system under testing
  late MockWeatherDataSource dataSource;

  setUp(() {
    dataSource = MockWeatherDataSource();
    sut = WeatherRepository(weatherRemoteDataSource: dataSource);
  });

  group('getWeatherModel', () {
    test('should call weatherRemoteDataSource.getCurrentWeather', () async {
      when(() => dataSource.getCurrentWeather('Warszawa'))
          .thenAnswer((_) async => WeatherModel(
                Location('Warszawa', 'Poland'),
                Current(10, Condition('Sunny'), 10, 'N', 1000, 10, 10, 10, 10),
              ));
      //2
      await sut.getWeatherModel(city: 'Warszawa');
      //3
      verify(() => dataSource.getCurrentWeather('Warszawa')).called(1);
    });

    test('should show weather data with provider city', () async {
      //1
      when(() => dataSource.getCurrentWeather('Warszawa'))
          .thenAnswer((_) async => WeatherModel(
                Location('Warszawa', 'Poland'),
                Current(10, Condition('Sunny'), 10, 'N', 1000, 10, 10, 10, 10),
              ));
      //2
      final result = await sut.getWeatherModel(city: 'Warszawa');
      //3
      expect(
        result,
        WeatherModel(
          Location('Warszawa', 'Poland'),
          Current(10, Condition('Sunny'), 10, 'N', 1000, 10, 10, 10, 10),
        ),
      );
    });
  });
}
