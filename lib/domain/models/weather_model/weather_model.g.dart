// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherModelImpl _$$WeatherModelImplFromJson(Map<String, dynamic> json) =>
    _$WeatherModelImpl(
      Location.fromJson(json['location'] as Map<String, dynamic>),
      Current.fromJson(json['current'] as Map<String, dynamic>),
      json['forecast'] == null
          ? null
          : Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeatherModelImplToJson(_$WeatherModelImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecast': instance.forecast,
    };

_$CurrentImpl _$$CurrentImplFromJson(Map<String, dynamic> json) =>
    _$CurrentImpl(
      (json['temp_c'] as num).toDouble(),
      Condition.fromJson(json['condition'] as Map<String, dynamic>),
      (json['wind_mph'] as num).toDouble(),
      json['wind_dir'] as String,
      (json['pressure_mb'] as num).toDouble(),
      (json['precip_mm'] as num).toDouble(),
      (json['humidity'] as num).toDouble(),
      (json['cloud'] as num).toDouble(),
      (json['feelslike_c'] as num).toDouble(),
    );

Map<String, dynamic> _$$CurrentImplToJson(_$CurrentImpl instance) =>
    <String, dynamic>{
      'temp_c': instance.tempC,
      'condition': instance.condition,
      'wind_mph': instance.windMph,
      'wind_dir': instance.windDir,
      'pressure_mb': instance.pressureMb,
      'precip_mm': instance.precipMm,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslike_c': instance.feelslikeC,
    };

_$ConditionImpl _$$ConditionImplFromJson(Map<String, dynamic> json) =>
    _$ConditionImpl(
      json['text'] as String,
    );

Map<String, dynamic> _$$ConditionImplToJson(_$ConditionImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
    };

_$ForecastImpl _$$ForecastImplFromJson(Map<String, dynamic> json) =>
    _$ForecastImpl(
      forecastday: (json['forecastday'] as List<dynamic>)
          .map((e) => Forecastday.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ForecastImplToJson(_$ForecastImpl instance) =>
    <String, dynamic>{
      'forecastday': instance.forecastday,
    };

_$ForecastdayImpl _$$ForecastdayImplFromJson(Map<String, dynamic> json) =>
    _$ForecastdayImpl(
      date: DateTime.parse(json['date'] as String),
      hour: (json['hour'] as List<dynamic>)
          .map((e) => Hour.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ForecastdayImplToJson(_$ForecastdayImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'hour': instance.hour,
    };

_$HourImpl _$$HourImplFromJson(Map<String, dynamic> json) => _$HourImpl(
      timeEpoch: json['time_epoch'] as int,
      time: json['time'] as String,
      tempC: (json['temp_c'] as num).toDouble(),
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HourImplToJson(_$HourImpl instance) =>
    <String, dynamic>{
      'time_epoch': instance.timeEpoch,
      'time': instance.time,
      'temp_c': instance.tempC,
      'condition': instance.condition,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      json['name'] as String,
      json['country'] as String,
      json['localtime'] as String,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'localtime': instance.localtime,
    };
