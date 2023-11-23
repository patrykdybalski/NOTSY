import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/features/home/pages/weather_page/cubit/weather_cubit.dart';

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
                backgroundColor: AppColors.greenLogoColor,
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
              )),
        ],
      ),
    );
  }
}
