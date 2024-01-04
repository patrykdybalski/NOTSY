import 'package:flutter/material.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/first_info_board.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/second_info_board.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/third_info_board.dart';

class WeatherInfoWidget extends StatelessWidget {
  const WeatherInfoWidget({required this.weatherModel, super.key});
  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            FirstInfoBoard(weatherModel),
            const SizedBox(height: 32),
            SecondInfoBoard(weatherModel),
            const SizedBox(height: 16),
            Divider(
                endIndent: 60,
                indent: 60,
                thickness: 0.8,
                color: Theme.of(context).colorScheme.secondary),
            const SizedBox(height: 8),
            ThirdInfoBoard(weatherModel)
          ],
        ),
      ),
    );
  }
}
