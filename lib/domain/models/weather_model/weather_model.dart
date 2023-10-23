import 'package:intl/intl.dart';

class WeatherModel {
  WeatherModel({
    required this.name,
    required this.country,
    required this.temperature,
    required this.wind,
    required this.rain,
    required this.barometr,
    required this.humidity,
    required this.text,
  });
  final String name;
  final String country;
  final double temperature;
  final double wind;
  final double rain;
  final double barometr;
  final double humidity;
  final String text;
}
