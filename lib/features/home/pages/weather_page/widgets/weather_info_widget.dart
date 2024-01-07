import 'package:flutter/material.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/first_info_board.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/forecast_weather_info.dart';

class WeatherInfoWidget extends StatelessWidget {
  const WeatherInfoWidget({required this.weatherModel, super.key});
  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FirstInfoBoard(weatherModel),
            const SizedBox(height: 32),
            const ForecastWeatherInfo(),
          ],
        ),
      ),
    );
  }
}
