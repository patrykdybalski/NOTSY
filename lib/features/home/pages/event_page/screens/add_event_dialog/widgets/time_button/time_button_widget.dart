import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';

class TimeButton extends StatelessWidget {
  const TimeButton({
    super.key,
    required this.selectedTimeFormatted,
    required this.onTimeChanged,
  });

  final String? selectedTimeFormatted;
  final Function(DateTime?) onTimeChanged;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.more_time_rounded,
        color: AppColors.secondaryColor,
      ),
      label: Text(
        selectedTimeFormatted ?? 'Dodaj godzinę',
        style: TextStyles.textStyleWhite(13),
      ),
      onPressed: () async {
        TimeOfDay? selectedTime = await showTimePicker(
          context: context,
          initialEntryMode: TimePickerEntryMode.dial,
          initialTime: TimeOfDay.now(),
        );

        onTimeChanged(selectedTime as DateTime);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.greenColor,
        shadowColor: AppColors.greenColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12.0,
          ),
        ),
      ),
    );
  }
}
