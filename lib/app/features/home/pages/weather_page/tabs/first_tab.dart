import 'package:flutter/material.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/constans/font_style.dart';

class FirstTab extends StatelessWidget {
  const FirstTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        // ignore: avoid_unnecessary_containers
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '12℃',
                    style: TextStyles.weatherStyle1,
                  ),
                  Text(
                    'Częściowe zachmurzenie ',
                    style: TextStyles.weatherStyle4,
                  ),
                ],
              ),
              const Icon(
                Icons.wb_sunny_outlined,
                size: 70,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          height: 100,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              12,
            ),
            border: Border.all(
              color: AppColors.dayColor,
            ),
          ),
        ),
      ],
    );
  }
}
