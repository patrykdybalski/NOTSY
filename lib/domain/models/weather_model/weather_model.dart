class WeatherModel {
  WeatherModel({
    required this.name,
    required this.country,
    required this.temperature,
    required this.cloudy,
    required this.direction,
    required this.wind,
    required this.rain,
    required this.barometr,
    required this.humidity,
    required this.text,
  });
  final String name;
  final String country;
  final double temperature;
  final double cloudy;
  final String direction;
  final double wind;
  final double rain;
  final double barometr;
  final double humidity;
  final String text;

  WeatherModel.fromJson(Map<String, dynamic> json)
      : name = json['location']['name'] + 0.0,
        country = json['location']['country'],
        temperature = json['current']['temp_c'] + 0.0,
        cloudy = json['current']['cloud'] + 0.0,
        direction = json['current']['wind_dir'],
        wind = json['current']['wind_mph'] + 0.0,
        rain = json['current']['precip_mm'] + 0.0,
        barometr = json['current']['pressure_mb'] + 0.0,
        humidity = json['current']['humidity'] + 0.0,
        text = json['current']['condition']['text'];
}
