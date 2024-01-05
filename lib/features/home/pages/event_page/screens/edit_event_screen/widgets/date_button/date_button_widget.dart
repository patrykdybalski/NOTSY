import 'package:flutter/material.dart';
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
        style: TextStyles.textStyle1(
          14,
          Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      icon: Icon(
        Icons.calendar_month_outlined,
        color: Theme.of(context).colorScheme.inversePrimary,
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
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shadowColor: Theme.of(context).colorScheme.secondary,
        elevation: 1.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12.0,
          ),
        ),
      ),
    );
  }
}
