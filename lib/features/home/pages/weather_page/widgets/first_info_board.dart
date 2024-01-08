import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/second_info_board.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/third_info_board.dart';

class FirstInfoBoard extends StatelessWidget {
  const FirstInfoBoard(this.weatherModel, {super.key});
  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    double? tempInt = weatherModel?.current.tempC;
    int? temperatureInCelsiusInteger = tempInt!.toInt();
    return Container(
      height: 285,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.background,
              Colors.blue.shade100,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topLeft,
          ),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).colorScheme.secondary,
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(1, 2)),
            BoxShadow(
                color: Theme.of(context).colorScheme.primary,
                blurRadius: 0.5,
                offset: const Offset(1, 0))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Aktualnie:',
                  style: TextStyles.textStyle2(
                    18,
                    Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                ThirdInfoBoard(weatherModel),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  getIconForName(weatherModel?.current.condition.text),
                  height: 90,
                ),
                SizedBox(
                  width: 190,
                  height: 120,
                  child: Row(
                    children: [
                      Text(
                        '$temperatureInCelsiusInteger',
                        style: TextStyles.textStyle1(
                          85,
                          Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(''),
                          const SizedBox(height: 10),
                          Text(
                            '°C',
                            style: TextStyles.textStyle1(
                              30,
                              Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            ' ${weatherModel?.current.feelslikeC}°C',
                            style: TextStyles.textStyle2(
                              16,
                              Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
                endIndent: 80,
                indent: 80,
                thickness: 1,
                color: Theme.of(context).colorScheme.secondary),
            const SizedBox(height: 8),
            SecondInfoBoard(weatherModel),
          ],
        ),
      ),
    );
  }

  getIconForName(String? iconName) {
    switch (iconName) {
      case "Partly cloudy":
        {
          return 'assets/images/partlyCloudy.png';
        }

      case "Sunny":
        {
          return 'assets/images/sunny.png';
        }

      case "Clear":
        {
          return 'assets/images/sunny.png';
        }

      case "Light rain":
        {
          return 'assets/images/lightRain.png';
        }

      case "Moderate rain":
        {
          return 'assets/images/moderateRain.png';
        }

      case "Blizzard":
        {
          return 'assets/images/blizzard.png';
        }

      case "Light rain shower":
        {
          return 'assets/images/lightRain.png';
        }

      case "Overcast":
        {
          return 'assets/images/partlyCloudy.png';
        }

      case "Light snow":
        {
          return 'assets/images/snow.png';
        }
      case "Light snow showers":
        {
          return 'assets/images/snow.png';
        }

      case "Moderate or heavy rain with thunder":
        {
          return 'assets/images/heavyWithThunder.png';
        }

      default:
        {
          return 'assets/images/sunny.png';
        }
    }
  }
}
