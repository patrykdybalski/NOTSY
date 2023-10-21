import 'package:flutter/material.dart';
import 'package:primary_school/app/features/home/pages/weather_page/tabs/first_tab.dart';
import 'package:primary_school/app/features/home/pages/weather_page/tabs/second_tab.dart';
import 'package:primary_school/app/features/home/pages/weather_page/tabs/third_tab.dart';
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.location_on_outlined,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: AppColors.greenColor,
              indicatorWeight: 1,
              indicatorPadding: const EdgeInsets.all(4),
              isScrollable: false,
              labelColor: AppColors.greenColor,
              unselectedLabelColor: AppColors.secondaryColor,
              dividerColor: AppColors.primaryColor,
              labelStyle: TextStyles.weatherStyle2,
              overlayColor:
                  const MaterialStatePropertyAll(AppColors.primaryColor),
              tabs: const [
                Tab(
                  text: 'Dzisiaj',
                ),
                Tab(
                  text: 'Jutro',
                ),
                Tab(
                  text: 'Pojutrze',
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  FirstTab(),
                  SecondTab(),
                  ThirdTab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
