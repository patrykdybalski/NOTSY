import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/case_weather_condition.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/second_info_board.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/location_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            Theme.of(context).colorScheme.outline.withOpacity(0.7),
            Theme.of(context).colorScheme.outlineVariant.withOpacity(0.7),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topLeft,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade100,
            blurRadius: 1,
            offset: const Offset(1, 0),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.access_time_outlined,
                      size: 20,
                    ),
                    Text(
                      ' ${AppLocalizations.of(context).currently}',
                      style: TextStyles.textStyle1(
                        16,
                        Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ],
                ),
                LocationInfo(weatherModel),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  CaseWeatherCondition().getIconForName(
                    weatherModel!.current.condition.text,
                    DateTime.parse(weatherModel!.location.localtime),
                  ),
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
}
