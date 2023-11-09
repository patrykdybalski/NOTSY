import 'package:flutter/material.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/constans/fonts_style.dart';

class TimeButton extends StatelessWidget {
  const TimeButton({
    super.key,
    required this.selectedTimeFormatted,
    required this.onTimeChanged,
  });

  final String? selectedTimeFormatted;
  final Function(DateTime? p1) onTimeChanged;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.more_time_rounded,
        color: AppColors.whiteColor,
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

        if (selectedTime != null) {
          DateTime now = DateTime.now();
          DateTime dateTime = DateTime(now.year, now.month, now.day,
              selectedTime.hour, selectedTime.minute);
          onTimeChanged(dateTime);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.greenLoginColor,
        shadowColor: AppColors.darkGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12.0,
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
    required this.onDayChanged,
  });

  final String? selectedDateFormatted;
  final Function(DateTime? p1) onDayChanged;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.calendar_month_outlined,
        color: AppColors.whiteColor,
      ),
      label: Text(
        selectedDateFormatted ?? 'Wybierz dzień',
        style: TextStyles.textStyleWhite(13),
      ),
      onPressed: () async {
        final selectedDate = await showDatePicker(
          initialEntryMode: DatePickerEntryMode.calendar,
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 365 * 10),
          ),
        );
        onDayChanged(selectedDate);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.redColor,
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12.0,
          ),
        ),
      ),
    );
  }
}

class SubtitleWidget extends StatelessWidget {
  const SubtitleWidget({
    super.key,
    required this.onSubtitleChanged,
  });

  final Function(String p1) onSubtitleChanged;

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
              color: AppColors.accentColor,
              width: 0.1,
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.accentColor,
            width: 0.1,
          ),
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.onTitleChanged,
  });

  final Function(String p1) onTitleChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onTitleChanged,
      autofocus: true,
      keyboardType: TextInputType.text,
      maxLength: 50,
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
              color: AppColors.accentColor,
              width: 0.3,
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.accentColor,
            width: 0.6,
          ),
        ),
      ),
    );
  }
}
