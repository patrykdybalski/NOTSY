import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';

class ForecastWeatherInfo extends StatefulWidget {
  const ForecastWeatherInfo(this.weatherModel, {Key? key}) : super(key: key);

  final WeatherModel weatherModel;

  @override
  State<ForecastWeatherInfo> createState() => _ForecastWeatherInfoState();
}

class _ForecastWeatherInfoState extends State<ForecastWeatherInfo> {
  String selectedEditDayFormatted(DateTime selectedDay) {
    final formatter = DateFormat('EEE H:mm', 'pl');
    return formatter.format(selectedDay);
  }

  String getIconForName(String iconName, DateTime time) {
    // Determine if it's day or night based on the time of day
    bool isDayTime = time.hour >= 6 && time.hour < 18;
    switch (iconName) {
      case "Partly cloudy":
      case "Overcast":
        return isDayTime
            ? 'assets/images/partlyCloudy.png'
            : 'assets/images/nightCloud.png';

      case "Sunny":
      case "Clear":
        return isDayTime ? 'assets/images/sunny.png' : 'assets/images/moon.png';

      case "Light rain":
      case "Light rain shower":
        return isDayTime
            ? 'assets/images/lightRain.png'
            : 'assets/images/nightMidRain.png';

      case "Moderate rain":
        return isDayTime
            ? 'assets/images/moderateRain.png'
            : 'assets/images/nightHighRain.png';

      case "Blizzard":
        return isDayTime
            ? 'assets/images/blizzard.png'
            : 'assets/images/nightCloud.png';

      case "Light snow":
      case "Light snow showers":
        return isDayTime
            ? 'assets/images/snow.png'
            : 'assets/images/nightSnow.png';

      case "Moderate or heavy rain with thunder":
        return isDayTime
            ? 'assets/images/heavyWithThunder.png'
            : 'assets/images/nightRainThunder.png';

      default:
        return isDayTime
            ? 'assets/images/sunny.png'
            : 'assets/images/nightMidRain.png';
    }
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
                            getIconForName(
                              hour.condition.text,
                              DateTime.parse(hour.time),
                            ),
                            height: 40,
                          ),
                          Text(
                            selectedEditDayFormatted(
                              DateTime.parse(
                                hour.time,
                              ),
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
}
