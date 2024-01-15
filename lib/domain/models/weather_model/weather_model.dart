import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_model.g.dart';
part 'weather_model.freezed.dart';

@freezed
class WeatherModel with _$WeatherModel {
  factory WeatherModel(
    Location location,
    Current current,
    Forecast? forecast,
  ) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@freezed
class Current with _$Current {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Current(
    double tempC,
    Condition condition,
    double windMph,
    String windDir,
    double pressureMb,
    double precipMm,
    double humidity,
    double cloud,
    double feelslikeC,
  ) = _Current;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
}

@freezed
class Condition with _$Condition {
  factory Condition(
    String text,
  ) = _Condition;

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);
}

@freezed
class Forecast with _$Forecast {
  const factory Forecast({
    @JsonKey(name: "forecastday") required List<Forecastday> forecastday,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}

@freezed
class Forecastday with _$Forecastday {
  const factory Forecastday({
    @JsonKey(name: "date") required DateTime date,
    @JsonKey(name: "hour") required List<Hour> hour,
  }) = _Forecastday;

  factory Forecastday.fromJson(Map<String, dynamic> json) =>
      _$ForecastdayFromJson(json);
}

@freezed
class Hour with _$Hour {
  const factory Hour({
    @JsonKey(name: "time_epoch") required int timeEpoch,
    @JsonKey(name: "time") required String time,
    @JsonKey(name: "temp_c") required double tempC,
    @JsonKey(name: "condition") required Condition condition,
  }) = _Hour;
  
  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);
}

@freezed
class Location with _$Location {
  const Location._();
  factory Location(
    String name,
    String country,
     String localtime
  ) = _Location;

  String get nameWithCountry {
    return '$name, $country';
  }

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}


