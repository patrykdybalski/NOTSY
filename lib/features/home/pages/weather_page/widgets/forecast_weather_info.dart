import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';

class ForecastWeatherInfo extends StatefulWidget {
  const ForecastWeatherInfo(this.weatherModel, {super.key});
  final WeatherModel weatherModel;

  @override
  State<ForecastWeatherInfo> createState() => _ForecastWeatherInfoState();
}

class _ForecastWeatherInfoState extends State<ForecastWeatherInfo> {
  String selectedEditDayFormatted(DateTime selectedDay) {
    final formatter = DateFormat('EEE H:mm', 'pl');
    return formatter.format(selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.weatherModel.forecast?.forecastday.length ?? 0,
        itemBuilder: (context, dayIndex) {
          final forecastDay =
              widget.weatherModel.forecast?.forecastday[dayIndex];
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 5,
                  color:
                      Theme.of(context).colorScheme.background.withOpacity(.3),
                )
              ],
            ),
            child: SizedBox(
              height: 170,
              child: Row(
                children: [
                  for (final hour in forecastDay?.hour ?? [])
                    Container(
                      height: 160,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.7),
                            Theme.of(context)
                                .colorScheme
                                .outlineVariant
                                .withOpacity(0.7),
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
                      margin: const EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            ' ${hour.tempC}°C',
                            style: TextStyles.textStyle2(
                              18,
                              Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          Image.asset(
                            getIconForName(hour.condition.text),
                            height: 50,
                          ),
                          Text(
                            selectedEditDayFormatted(
                              DateTime.parse(
                                  hour.time), // Konwersja na DateTime
                            ),
                            style: TextStyles.textStyle1(
                              15,
                              Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        },
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
