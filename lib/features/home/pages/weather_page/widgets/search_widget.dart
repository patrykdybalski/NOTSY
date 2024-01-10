import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      padding: const EdgeInsets.symmetric(vertical: 16.0),
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
      child: Card(
        color: Theme.of(context).colorScheme.primary.withOpacity(1),
        elevation: 1,
        surfaceTintColor: Colors.transparent,
        child: TextField(
          controller: controller,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          cursorColor: Theme.of(context).colorScheme.inversePrimary,
          decoration: InputDecoration(
            label: Text(
              'Miejscowość',
              style: TextStyles.textStyle1(
                13,
                Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            hintText: 'Podaj nazwę ',
            hintStyle: TextStyles.textStyle1(
              13,
              Theme.of(context).colorScheme.inversePrimary,
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.primary,
            prefixIcon: const Icon(Icons.gps_fixed_outlined),
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
          elevation: 1,
          shadowColor: Theme.of(context).colorScheme.tertiary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12.0,
            ),
          ),
        ),
        child: Text(
          'Sprawdź',
          style: TextStyles.textStyle2(
            14,
            Theme.of(context).colorScheme.primary,
          ),
        ));
  }
}
