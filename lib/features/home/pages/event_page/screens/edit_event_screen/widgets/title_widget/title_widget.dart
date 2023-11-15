import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';

class EditTitleWidget extends StatelessWidget {
  const EditTitleWidget({
    super.key,
    required this.eventModel,
    required this.onTitleChanged,
  });

  final EventModel eventModel;
  final Function(String? p1) onTitleChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.justify,
      initialValue: eventModel.title,
      onChanged: onTitleChanged,
      autofocus: true,
      maxLength: 50,
      maxLines: 2,
      minLines: 1,
      keyboardType: TextInputType.text,
      cursorColor: Colors.white10,
      cursorRadius: const Radius.circular(12),
      style: const TextStyle(
        color: AppColors.secondaryColor,
      ),
      decoration: InputDecoration(
        labelText: 'Tytuł',
        filled: true,
        fillColor: Colors.white10,
        labelStyle: const TextStyle(
          color: AppColors.secondaryColor,
          fontSize: 18,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.redColor,
              width: 1.0,
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.darkGreen,
            width: 0.3,
          ),
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.darkGreen,
              width: 0.3,
            )),
      ),
    );
  }
}
