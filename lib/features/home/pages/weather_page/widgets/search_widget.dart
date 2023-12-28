import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/features/home/pages/weather_page/cubit/weather_cubit.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({
    super.key,
  });
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CityTextController(controller: _controller),
          const SizedBox(width: 16),
          CheckWeatherButton(controller: _controller)
        ],
      ),
    );
  }
}

class CityTextController extends StatelessWidget {
  const CityTextController({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
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
    );
  }
}

class CheckWeatherButton extends StatelessWidget {
  const CheckWeatherButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.read<WeatherCubit>().getWeatherModel(city: controller.text);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.greenColor,
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
          style: TextStyles.textStyleWhite1(13),
        ));
  }
}
