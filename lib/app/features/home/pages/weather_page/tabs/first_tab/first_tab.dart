import 'package:flutter/material.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/constans/font_style.dart';
import 'package:weather_icons/weather_icons.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({super.key});

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: AppColors.secondaryColor,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      '12℃',
                      style: TextStyles.weatherStyle1,
                    ),
                    Text(
                      ' Zachmurzenie ',
                      style: TextStyles.weatherStyle5,
                    ),
                  ],
                ),
                const Icon(
                  Icons.wb_sunny_outlined,
                  size: 70,
                ),
              ],
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
                      const BoxedIcon(WeatherIcons.sunrise),
                      const SizedBox(width: 10),
                      Text(
                        '7:20',
                        style: TextStyles.weatherStyle3,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const BoxedIcon(WeatherIcons.sunset),
                      const SizedBox(width: 10),
                      Text(
                        '21:20',
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
                        '60 km/h',
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
                        '18%',
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
                        '1020 hPa',
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
                        '40%',
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
                'Karlino, Poland',
                style: TextStyles.weatherStyle6,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
