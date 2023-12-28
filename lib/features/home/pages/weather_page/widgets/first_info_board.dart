import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';

class FirstInfoBoard extends StatelessWidget {
  const FirstInfoBoard(this.weatherModel, {super.key});
  final WeatherModel? weatherModel;

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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppColors.secondaryColor,
            blurRadius: 0.8,
            spreadRadius: 0.5,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${weatherModel?.current.tempC}°C',
                style: TextStyles.textStyle3(56),
              ),
              Text(
                'Odczuwalne ${weatherModel?.current.feelslikeC}°C',
                style: TextStyles.textStyle3(14),
              ),
            ],
          ),
          Image.asset(
            getIconForName(weatherModel?.current.condition.text),
            height: 90,
          ),
        ],
      ),
    );
  }
}