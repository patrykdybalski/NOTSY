part of 'weather_cubit.dart';

@immutable
class WeatherState {
  const WeatherState({
    this.model,
    this.status = Status.initial,
    this.errorMessage,
  });
  final WeatherModel? model;
  final Status status;
  final String? errorMessage;
}
