import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
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
      child:
          BlocConsumer<WeatherCubit, WeatherState>(listener: (context, state) {
        // if (state.status == Status.error) {
        //
        // }
      }, builder: (context, state) {
        final weatherModel = state.model;
        switch (state.status) {
          case Status.initial:
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SearchWidget(),
                const SizedBox(height: 16),
                const WarningOfCityName()
              ],
            );
          case Status.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case Status.error:
            return Center(
              child: Text(
                state.errorMessage ?? 'Unknown error',
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            );

          case Status.success:
            return WeatherBody(weatherModel);
        }
      }),
    );
  }
}

class WarningOfCityName extends StatelessWidget {
  const WarningOfCityName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        children: [
          Text(
            'Wersja testowa',
            style: TextStyles.textStyleRed(20),
          ),
          const SizedBox(height: 16),
          Text(
            'Wpisując nazwę, zamień polskie znaki: ą = a, ę = e, ó = o, ż = z, ń = n ...',
            style: TextStyles.textStyle2(16),
          ),
        ],
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
