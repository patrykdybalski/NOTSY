import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/app/features/home/pages/weather_page/cubit/weather_cubit.dart';
import 'package:primary_school/app/features/home/pages/weather_page/tabs/first_tab/first_tab.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/constans/fonts_style.dart';

import 'package:primary_school/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:primary_school/domain/repositories/weather/weather_repository.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WeatherCubit(WeatherRepository(WeatherRemoteRetrofitDataSource(Dio()))),
      child: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unknown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: AppColors.redColor,
              ),
            );
          }
        },
        builder: (context, state) {
          final weatherModel = state.model;
          return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: AppColors.primaryColor,
            appBar: AppBar(
              title: const Text('Progonza pogody'),
              titleTextStyle: TextStyles.textStyle2(24),
              centerTitle: true,
              backgroundColor: AppColors.primaryColor,
              forceMaterialTransparency: true,
            ),
            body: Column(
              children: [
                if (weatherModel != null)
                  Expanded(
                    child: FirstTab(
                      weatherModel: weatherModel,
                    ),
                  ),
                SearchWidget(),
              ],
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
                  style: TextStyles.textStyle2(13),
                ),
                hintText: 'Podaj nazwę ',
                hintStyle: TextStyles.textStyle2(13),
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
                    16.0,
                  ),
                ),
              ),
              child: Text(
                'Sprawdź',
                style: TextStyles.textStyleWhite(13),
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
      labelStyle: TextStyles.textStyle1(16),
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
