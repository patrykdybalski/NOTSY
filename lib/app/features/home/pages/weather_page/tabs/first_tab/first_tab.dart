import 'package:flutter/material.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/constans/font_style.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';
import 'package:weather_icons/weather_icons.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({required this.weatherModel, super.key});
  final WeatherModel? weatherModel;

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 24,
            ),
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.primaryColor,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.redColor,
                    blurRadius: 1.2,
                    spreadRadius: 0.3,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${widget.weatherModel?.current.tempC}℃',
                          style: TextStyles.weatherStyle1,
                        ),
                        Text(
                          'Odczuwalne ${widget.weatherModel?.current.feelsLikeC}℃',
                          style: TextStyles.weatherStyle5,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      width: 135,
                      height: 80,
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${widget.weatherModel?.current.condition.text}',
                                style: TextStyles.weatherStyle6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const BoxedIcon(
                          WeatherIcons.wind,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          widget.weatherModel?.current.windDir ?? 'null',
                          style: TextStyles.weatherStyle3,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const BoxedIcon(WeatherIcons.cloudy),
                        const SizedBox(width: 10),
                        Text(
                          '${widget.weatherModel?.current.cloud} %',
                          style: TextStyles.weatherStyle3,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const BoxedIcon(WeatherIcons.strong_wind),
                        const SizedBox(width: 10),
                        Text(
                          '${widget.weatherModel?.current.windMph} km/h',
                          style: TextStyles.weatherStyle3,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const BoxedIcon(
                          WeatherIcons.umbrella,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${widget.weatherModel?.current.precipMm} mm',
                          style: TextStyles.weatherStyle3,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const BoxedIcon(
                          WeatherIcons.barometer,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${widget.weatherModel?.current.pressureMb} hPa',
                          style: TextStyles.weatherStyle3,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const BoxedIcon(WeatherIcons.humidity),
                        const SizedBox(width: 10),
                        Text(
                          '${widget.weatherModel?.current.humidity} %',
                          style: TextStyles.weatherStyle3,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            const Divider(
              endIndent: 80,
              indent: 80,
              thickness: 0.3,
              color: AppColors.secondaryColor,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on_outlined),
                Text(
                  ' ${widget.weatherModel?.location.name} ',
                  style: TextStyles.weatherStyle6,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
