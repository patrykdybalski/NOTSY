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
                Text(
                  '${widget.weatherModel?.temperature.toString()}℃',
                  style: TextStyles.weatherStyle1,
                ),
                Text(
                  '${widget.weatherModel?.text}',
                  style: TextStyles.weatherStyle2,
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
                        'sunrise',
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
                        'sunset',
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
                        '${widget.weatherModel?.wind.toString()} km/h',
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
                        '${widget.weatherModel?.rain.toString()} mm',
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
                        '${widget.weatherModel?.barometr.toString()} hPa',
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
                        '${widget.weatherModel?.humidity.toString()} %',
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
                ' ${widget.weatherModel?.name}, ${widget.weatherModel?.country}',
                style: TextStyles.weatherStyle6,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
