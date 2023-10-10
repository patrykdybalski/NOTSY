import 'package:flutter/material.dart';
import 'package:primary_school/constans/colors.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenLoginColor,
      appBar: AppBar(
        title: const Text('Pogoda'),
        titleTextStyle: const TextStyle(
          color: AppColors.secondaryColor,
          fontSize: 20,
        ),
        centerTitle: true,
        backgroundColor: AppColors.greenLoginColor,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_circle_outline_outlined,
              size: 35,
              color: Color(0xffC94CBA),
            ),
            padding: const EdgeInsets.only(right: 5),
          ),
        ],
      ),
    );
  }
}
