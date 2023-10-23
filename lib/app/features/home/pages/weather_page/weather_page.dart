import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:primary_school/app/features/home/pages/weather_page/cubit/weather_cubit.dart';
import 'package:primary_school/app/features/home/pages/weather_page/tabs/first_tab/first_tab.dart';
import 'package:primary_school/app/features/home/pages/weather_page/tabs/second_tab/second_tab.dart';
import 'package:primary_school/app/features/home/pages/weather_page/tabs/third_tab/third_tab.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/constans/font_style.dart';
import 'package:primary_school/domain/repositories/weather/weather_repository.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(WeatherRepository()),
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          final weatherModel = state.model;
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: AppColors.primaryColor,
              appBar: AppBar(
                title: const Text('Progonza pogody'),
                titleTextStyle: TextStyles.headingStyle,
                centerTitle: true,
                backgroundColor: AppColors.primaryColor,
              ),
              body: Column(
                children: [
                  if (weatherModel != null) const TabBarWidget(),
                  Expanded(
                    child: TabBarView(
                      children: [
                        FirstTab(
                          weatherModel: weatherModel,
                        ),
                        SecondTab(),
                        ThirdTab(),
                      ],
                    ),
                  ),
                  SearchWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  SearchWidget({
    super.key,
  });
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                label: Text(
                  'Miasto',
                  style: TextStyles.weatherStyle5,
                ),
                hintText: 'Podaj nazwę ',
                hintStyle: TextStyles.weatherStyle5,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppColors.redColor,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppColors.redColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppColors.redColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          ElevatedButton(
              onPressed: () {
                context
                    .read<WeatherCubit>()
                    .getWeatherModel(city: _controller.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.redColor,
                elevation: 1.5,
                shadowColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                ),
              ),
              child: Text(
                'Sprawdź',
                style: TextStyles.weatherStyle5,
              )),
        ],
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: AppColors.redColor,
      indicatorWeight: 1,
      indicatorPadding: const EdgeInsets.all(4),
      isScrollable: false,
      labelColor: AppColors.redColor,
      unselectedLabelColor: AppColors.secondaryColor,
      dividerColor: AppColors.primaryColor,
      labelStyle: TextStyles.weatherStyle2,
      overlayColor: const MaterialStatePropertyAll(AppColors.primaryColor),
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
    );
  }
}
