import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';

class EditDateButton extends StatelessWidget {
  const EditDateButton({
    super.key,
    required this.selectedDateFormatted,
    required this.eventModel,
    required this.onDayChanged,
  });

  final String? selectedDateFormatted;
  final EventModel eventModel;
  final Function(DateTime?) onDayChanged;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(
        selectedDateFormatted ?? eventModel.selectedEditDayFormatted(),
        style: TextStyles.textStyleWhite(14),
      ),
      icon: const Icon(
        Icons.calendar_month_outlined,
        color: AppColors.whiteColor,
      ),
      onPressed: () async {
        DateTime? selectedDate = await showDatePicker(
          context: context,
          locale: const Locale("pl", "PL"),
          initialDatePickerMode: DatePickerMode.day,
          initialDate: eventModel.selectedDay,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 365 * 10),
          ),
        );

        onDayChanged(selectedDate);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.redColor,
        elevation: 1.5,
        shadowColor: AppColors.accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
      ),
    );
  }
}
