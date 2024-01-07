import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';
import 'package:primary_school/domain/repositories/weather/weather_repository.dart';
part 'weather_cubit.freezed.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(WeatherState());

  final WeatherRepository _weatherRepository;

  Future<void> getWeatherModel({
    required String city,
  }) async {
    emit(WeatherState(
      status: Status.loading,
    ));
    String cityNameWithoutPolishChars = replacePolishCharacters(city);
    try {
      final weatherModel = await _weatherRepository.getWeatherModel(
          city: cityNameWithoutPolishChars);
      emit(
        WeatherState(
          model: weatherModel,
          status: Status.success,
        ),
      );
    } catch (error) {
      String errorMessageToShow = 'Wystąpił błąd';
      // ignore: deprecated_member_use
      if (error is DioError) {
        // ignore: deprecated_member_use
        DioError dioError = error;
        if (dioError.response != null) {
          int statusCode = dioError.response!.statusCode ?? 0;
          
          if (statusCode == 400) {
            errorMessageToShow = 'Błędna nazwa miasta';
          } else if (statusCode == 500) {
            errorMessageToShow = 'Wystąpił inny błąd';
          }
      
        }
      }
      emit(
        WeatherState(
          status: Status.error,
          errorMessage: errorMessageToShow,
        ),
      );
    }
  }

  String replacePolishCharacters(String input) {
    Map<String, String> polishCharacters = {
      'ą': 'a',
      'ć': 'c',
      'ę': 'e',
      'ł': 'l',
      'ń': 'n',
      'ó': 'o',
      'ś': 's',
      'ż': 'z',
      'ź': 'z',
    };

    polishCharacters.forEach((key, value) {
      input = input.replaceAll(key, value);
    });

    return input;
  }
}
