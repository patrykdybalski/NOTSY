import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  WeatherModel({
    required this.location,
    required this.current,
  });
  @JsonKey(name: "location")
  Location location;
  @JsonKey(name: "current")
  Current current;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class Current {
  Current({
    required this.tempC,
    required this.condition,
    required this.windMph,
    required this.windDir,
    required this.pressureMb,
    required this.precipMm,
    required this.humidity,
    required this.cloud,
    required this.feelsLikeC,
  });

  @JsonKey(name: "temp_c")
  double tempC;
  @JsonKey(name: "condition")
  Condition condition;
  @JsonKey(name: "wind_mph")
  double windMph;
  @JsonKey(name: "wind_dir")
  String windDir;
  @JsonKey(name: "pressure_mb")
  double pressureMb;
  @JsonKey(name: "precip_mm")
  double precipMm;
  @JsonKey(name: "humidity")
  double humidity;
  @JsonKey(name: "cloud")
  double cloud;
  @JsonKey(name: "feelslike_c")
  double feelsLikeC;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

@JsonSerializable()
class Condition {
  Condition({
    required this.text,
  });

  String text;

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

@JsonSerializable()
class Location {
  Location({
    required this.name,
    required this.country,
  });

  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "country")
  String country;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}


// // class WeatherModel {
//   WeatherModel({
//     required this.name,
//     required this.country,
//     required this.temperature,
//     required this.cloudy,
//     required this.direction,
//     required this.wind,
//     required this.rain,
//     required this.barometr,
//     required this.humidity,
//     required this.text,
//   });
//   final String name;
//   final String country;
//   final double temperature;
//   final double cloudy;
//   final String direction;
//   final double wind;
//   final double rain;
//   final double barometr;
//   final double humidity;
//   final String text;

//   String? get nameWithCountry {
//     return '$name, $country';
//   }

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
