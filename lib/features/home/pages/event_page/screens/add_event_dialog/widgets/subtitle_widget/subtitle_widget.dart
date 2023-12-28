
import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';

class SubtitleWidget extends StatelessWidget {
  const SubtitleWidget({
    super.key,
    required this.onSubtitleChanged,
  });

  final Function(String?) onSubtitleChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onSubtitleChanged,
      keyboardType: TextInputType.multiline,
      scrollPhysics:
          const ClampingScrollPhysics(), // Dodaj to, aby umożliwić przewijanie
      maxLines: 10,
      minLines: 3,

      cursorColor: AppColors.secondaryColor,
      cursorRadius: const Radius.circular(12),
      style: TextStyles.textStyle1(16),
      decoration: InputDecoration(
        labelText: 'Szczegóły',
        alignLabelWithHint: true,
        labelStyle: TextStyles.textStyle1(14),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.redColor,
              width: 0.2,
            )),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.greenColor,
              width: 0.1,
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.greenColor,
            width: 0.1,
          ),
        ),
      ),
    );
  }
}

