import 'package:flutter/material.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/first_info_board.dart';

class WeatherInfoWidget extends StatelessWidget {
  const WeatherInfoWidget({required this.weatherModel, super.key});
  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            FirstInfoBoard(weatherModel),
            const SizedBox(height: 32),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
