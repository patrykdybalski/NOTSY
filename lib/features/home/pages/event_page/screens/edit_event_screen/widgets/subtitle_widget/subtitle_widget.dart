import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';

class EditSubtitleWidget extends StatelessWidget {
  const EditSubtitleWidget({
    super.key,
    required this.eventModel,
    required this.onSubtitleChanged,
  });

  final EventModel eventModel;
  final Function(String? p1) onSubtitleChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(colors: [
          AppColors.primaryColor2,
          AppColors.primaryColor2,
          AppColors.primaryColor3
        ]),
      ),
      child: TextFormField(
        initialValue: eventModel.subtitle,
        onChanged: onSubtitleChanged,
        keyboardType: TextInputType.multiline,
        maxLines: 10,
        minLines: 4,
        scrollPhysics:
            const ClampingScrollPhysics(), // Dodaj to, aby umożliwić przewijanie
        cursorColor: AppColors.secondaryColor,
        cursorRadius: const Radius.circular(12),

        style: TextStyles.textStyle1(16),
        decoration: InputDecoration(
          enabled: true,
          labelText: 'Szczegóły',
          alignLabelWithHint: true,
          labelStyle: TextStyles.textStyle1(14),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.redColor,
                width: 0.2,
              )),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.greenColor,
              width: 0.3,
            ),
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.greenColor,
                width: 0.1,
              )),
        ),
      ),
    );
  }
}
