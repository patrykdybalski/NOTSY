import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';

class LocationInfo extends StatelessWidget {
  const LocationInfo(this.weatherModel, {super.key});

  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.location_on_outlined,
          size: 20,
        ),
        Text(
          ' ${weatherModel?.location.nameWithCountry} ',
          style: TextStyles.textStyle1(
            16,
            Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ],
    );
  }
}
