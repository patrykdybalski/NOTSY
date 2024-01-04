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
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.primary,
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
        child: TextField(
          controller: controller,
          cursorColor: Theme.of(context).colorScheme.inversePrimary,
          decoration: InputDecoration(
            label: Text(
              'Miejscowość',
              style: TextStyles.textStyle1(13),
            ),
            hintText: 'Podaj nazwę ',
            hintStyle: TextStyles.textStyle1(13),
            filled: true,
            fillColor: Theme.of(context).colorScheme.primary,
            prefixIcon: const Icon(Icons.gps_not_fixed_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 0.3,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 0.3,
              ),
            ),
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
          backgroundColor: Theme.of(context).colorScheme.tertiary,
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
          style: TextStyles.textStyle2(14),
        ));
  }
}
