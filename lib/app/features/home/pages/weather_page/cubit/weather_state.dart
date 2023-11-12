part of 'weather_cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  factory WeatherState({
    @Default(null) WeatherModel? model,
    @Default(Status.initial) Status status,
    String? errorMessage,
  }) = _WeatherState;
}


// @immutable
// class WeatherState {
//   const WeatherState({
//     this.model,
//     this.status = Status.initial,
//     this.errorMessage,
//   });
//   final WeatherModel? model;
//   final Status status;
//   final String? errorMessage;
// }
