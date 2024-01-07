import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';
import 'package:primary_school/features/home/pages/weather_page/cubit/weather_cubit.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/search_widget.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/weather_info_widget.dart';

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
            return const InitialWeatherPage();
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
            return const InitialWeatherPage();
          case Status.success:
            return WeatherBody(weatherModel);
        }
      }),
    );
  }
}

class InitialWeatherPage extends StatelessWidget {
  const InitialWeatherPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 320,
              width: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Colors.blue.shade100,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topLeft,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).colorScheme.secondary,
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: const Offset(1, 2)),
                    BoxShadow(
                        color: Theme.of(context).colorScheme.primary,
                        blurRadius: 0.5,
                        offset: const Offset(1, 0))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/term.png',
                    height: 200,
                    width: 100,
                  ),
                ],
              ),
            ),
            SearchWidget(),
            const SizedBox(height: 16),
          ],
        ),
      ),
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
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          if (weatherModel != null)
            Expanded(
              child: WeatherInfoWidget(
                weatherModel: weatherModel,
              ),
            ),
          SearchWidget(),
        ],
      ),
    );
  }
}
