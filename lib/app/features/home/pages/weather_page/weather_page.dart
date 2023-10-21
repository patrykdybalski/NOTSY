import 'package:flutter/material.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/constans/font_style.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          title: const Text('Karlino, Polska'),
          titleTextStyle: TextStyles.headingStyle,
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          leadingWidth: 60,
          leading: const Icon(
            Icons.location_on_outlined,
            size: 30,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {},
          child: const Icon(
            Icons.location_searching_outlined,
            color: AppColors.secondaryColor,
            size: 27,
          ),
        ),
        body: const Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  text: 'Dziś',
                ),
                Tab(
                  text: 'Jutro',
                ),
                Tab(
                  text: 'Pojutrze',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
