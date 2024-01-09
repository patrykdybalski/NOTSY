import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';
import 'package:primary_school/features/home/pages/weather_page/cubit/weather_cubit.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/advert_container.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/search_widget.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/weather_info_widget.dart';

import 'screens/initial_weather_screen.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WeatherCubit>(),
      child: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        final weatherModel = state.model;
        switch (state.status) {
          case Status.initial:
            return const InitialWeatherScreen();
          case Status.loading:
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            );

          case Status.error:
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? 'Unknown error'),
                  backgroundColor: Theme.of(context).colorScheme.error,
                  duration: const Duration(seconds: 2),
                ),
              );
            });
            return const InitialWeatherScreen();
          case Status.success:
            return WeatherBody(weatherModel);
        }
      }),
    );
  }
}

class WeatherBody extends StatelessWidget {
  const WeatherBody(
    this.weatherModel, {
    Key? key,
  }) : super(key: key);
  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            if (weatherModel != null)
              WeatherInfoWidget(
                weatherModel: weatherModel,
              ),
            SearchWidget(),
            const AdvertContainer(),
          ],
        ),
      ),
    );
  }
}
