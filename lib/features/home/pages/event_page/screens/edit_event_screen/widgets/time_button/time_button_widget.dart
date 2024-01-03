import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';

class EditTimeButton extends StatelessWidget {
  const EditTimeButton({
    super.key,
    required this.selectedTimeFormatted,
    required this.eventModel,
    required this.onTimeChanged,
  });

  final String? selectedTimeFormatted;
  final EventModel eventModel;
  final Function(DateTime?) onTimeChanged;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(
        selectedTimeFormatted ?? eventModel.selectedTimeFormatted(),
        style: TextStyles.textStyle1(14),
      ),
      icon: Icon(
        Icons.more_time_rounded,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      onPressed: () async {
        TimeOfDay? selectedTime = await showTimePicker(
          context: context,
          initialEntryMode: TimePickerEntryMode.dial,
          
          initialTime: TimeOfDay.fromDateTime(eventModel.selectedTime),
        );

        if (selectedTime != null) {
          DateTime now = DateTime.now();
          DateTime dateTime = DateTime(now.year, now.month, now.day,
              selectedTime.hour, selectedTime.minute);
          onTimeChanged(dateTime);
        }
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
