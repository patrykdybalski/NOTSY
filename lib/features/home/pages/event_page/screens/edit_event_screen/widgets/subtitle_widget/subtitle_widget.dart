import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
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
    return TextFormField(
      initialValue: eventModel.subtitle,
      onChanged: onSubtitleChanged,
      keyboardType: TextInputType.multiline,
      maxLines: 10,
      minLines: 4,
      scrollPhysics:
          const ClampingScrollPhysics(), // Dodaj to, aby umożliwić przewijanie
      cursorColor: AppColors.secondaryColor,
      cursorRadius: const Radius.circular(12),
      style: const TextStyle(
        color: AppColors.secondaryColor,
      ),
      decoration: InputDecoration(
        enabled: true,
        labelText: 'Opis',
        labelStyle: const TextStyle(
          color: AppColors.secondaryColor,
          fontSize: 18,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.redColor,
              width: 0.6,
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
              width: 0.3,
            )),
      ),
    );
  }
}