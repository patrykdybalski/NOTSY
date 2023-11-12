import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.g.dart';
part 'weather_model.freezed.dart';

@freezed
class WeatherModel with _$WeatherModel {
  factory WeatherModel(
    Location location,
    Current current,
  ) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@freezed
class Current with _$Current {
  factory Current(
    @JsonKey(name: "temp_c") double tempC,
    Condition condition,
    @JsonKey(name: "wind_mph") double windMph,
    @JsonKey(name: "wind_dir") String windDir,
    @JsonKey(name: "pressure_mb") double pressureMb,
    @JsonKey(name: "precip_mm") double precipMm,
    double humidity,
    double cloud,
    @JsonKey(name: "feelslike_c") double feelsLikeC,
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
class Location with _$Location {
  factory Location(
    String name,
    String country,
  ) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}


//   WeatherModel.fromJson(Map<String, dynamic> json)
//       : name = json['location']['name'],
//         country = json['location']['country'],
//         temperature = json['current']['temp_c'] + 0.0,
//         cloudy = json['current']['cloud'] + 0.0,
//         direction = json['current']['wind_dir'],
//         wind = json['current']['wind_mph'] + 0.0,
//         rain = json['current']['precip_mm'] + 0.0,
//         barometr = json['current']['pressure_mb'] + 0.0,
//         humidity = json['current']['humidity'] + 0.0,
//         text = json['current']['condition']['text'];
// }
