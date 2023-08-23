import 'package:flutter/material.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';

class TimeButton extends StatelessWidget {
  const TimeButton({
    super.key,
    required this.selectedTimeFormatted,
    required this.eventModel,
    required this.onTimeChanged,
  });

  final String? selectedTimeFormatted;
  final EventModel eventModel;
  final Function(DateTime? p1) onTimeChanged;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(
        selectedTimeFormatted ?? eventModel.selectedTimeFormatted(),
        style: const TextStyle(
          color: AppColors.accentColor,
        ),
      ),
      icon: const Icon(
        Icons.more_time_rounded,
        color: AppColors.secondaryColor,
      ),
      onPressed: () async {
        TimeOfDay? selectedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );

        if (selectedTime != null) {
          DateTime now = DateTime.now();
          DateTime dateTime = DateTime(now.year, now.month, now.day,
              selectedTime.hour, selectedTime.minute);
          onTimeChanged(dateTime);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        elevation: 2,
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

class DayButton extends StatelessWidget {
  const DayButton({
    super.key,
    required this.selectedDateFormatted,
    required this.eventModel,
    required this.onDayChanged,
  });

  final String? selectedDateFormatted;
  final EventModel eventModel;
  final Function(DateTime? p1) onDayChanged;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(
        selectedDateFormatted ?? eventModel.selectedEditDayFormatted(),
        style: const TextStyle(
          color: AppColors.accentColor,
        ),
      ),
      icon: const Icon(
        Icons.calendar_month_outlined,
        color: AppColors.secondaryColor,
      ),
      onPressed: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: eventModel.selectedDay,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 365 * 10),
          ),
        );
        onDayChanged(selectedDate);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
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

class SubtitleField extends StatelessWidget {
  const SubtitleField({
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

class TitleField extends StatelessWidget {
  const TitleField({
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
        labelText: 'Temat',
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
