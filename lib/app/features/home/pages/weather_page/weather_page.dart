import 'package:flutter/material.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/constans/font_style.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text('Pogoda'),
        titleTextStyle: TextStyles.headingStyle,
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.location_searching_outlined,
              size: 30,
              weight: 40,
              color: AppColors.secondaryColor,
            ),
            padding: const EdgeInsets.only(right: 5),
          ),
        ],
      ),
    );
  }
}
