import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.onTitleChanged,
  });

  final Function(String?) onTitleChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(colors: [
            AppColors.primaryColor2,
            AppColors.primaryColor2,
            AppColors.primaryColor3
          ])),
      child: TextFormField(
        onChanged: onTitleChanged,
        autofocus: true,
        keyboardType: TextInputType.text,
        maxLines: 2,
        minLines: 1,
        cursorColor: AppColors.secondaryColor,
        cursorRadius: const Radius.circular(12),
        style: TextStyles.textStyle2(16),
        decoration: InputDecoration(
          labelText: 'Temat',
          labelStyle: TextStyles.textStyle2(16),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.redColor,
                width: 1,
              )),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.greenColor,
                width: 0.3,
              )),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.greenColor,
              width: 0.6,
            ),
          ),
        ),
      ),
    );
  }
}
