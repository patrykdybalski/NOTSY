import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';
import 'package:primary_school/domain/repositories/weather/weather_repository.dart';
import 'package:primary_school/features/home/pages/weather_page/cubit/weather_cubit.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late WeatherCubit sut;
  late MockWeatherRepository repository;

  setUp(() {
    repository = MockWeatherRepository();
    sut = WeatherCubit(repository);
  });

  group('getWeatherModel', () {
    group('success', () {
      setUp(() {
        when(() => repository.getWeatherModel(city: 'Warszawa'))
            .thenAnswer((_) async => WeatherModel(
                  Location('Warszawa', 'Poland'),
                  Current(
                    10,
                    Condition('Sunny'),
                    10,
                    'N',
                    1000,
                    10,
                    10,
                    10,
                    10,
                  ),
                ));
      });

      blocTest<WeatherCubit, WeatherState>(
        'emits Status.loading then Status.success with weatherModel(city)',
        build: () => sut,
        act: (cubit) => cubit.getWeatherModel(city: 'Warszawa'),
        expect: (() => {
              WeatherState(status: Status.loading),
              WeatherState(
                status: Status.success,
                model: WeatherModel(
                    Location('Warszawa', 'Poland'),
                    Current(
                        10, Condition('Sunny'), 10, 'N', 1000, 10, 10, 10, 10)),
              )
            }),
      );
    });
    group('failure', () {
      setUp(() {
        when(() => repository.getWeatherModel(city: 'Warszawa'))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<WeatherCubit, WeatherState>(
        'emits Status.loading then Status.error with errorMessage',
        build: () => sut,
        act: (cubit) => cubit.getWeatherModel(city: 'Warszawa'),
        expect: (() => {
            
                WeatherState(status: Status.loading),
                WeatherState(
                    status: Status.error,
                    errorMessage: 'Exception: test-exception-error'),
              
            }),
      );
    });
  });
  //1
  //2
  //3
}
