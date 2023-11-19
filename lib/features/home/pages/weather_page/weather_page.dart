import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/features/home/pages/weather_page/cubit/weather_cubit.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/search_widget.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/weather_info_widget.dart';


class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WeatherCubit>(),
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
                    child: WeatherInfoWidget(
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



