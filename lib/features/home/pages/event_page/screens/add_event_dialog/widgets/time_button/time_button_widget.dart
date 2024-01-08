import 'package:flutter/material.dart';
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
      icon: Icon(
        Icons.more_time_rounded,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      label: Text(
        selectedTimeFormatted ?? 'Dodaj godzinę',
        style: TextStyles.textStyle1(
          14,
          Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      onPressed: () async {
        TimeOfDay? selectedTime = await showTimePicker(
          context: context,
          initialEntryMode: TimePickerEntryMode.dial,
          initialTime: TimeOfDay.now(),
          builder: (BuildContext context, Widget? child) {
            ThemeData currentTheme = Theme.of(context);
            return timePickerTheme(context, currentTheme, child);
          },
        );
        if (selectedTime != null) {
          DateTime now = DateTime.now();
          DateTime dateTime = DateTime(now.year, now.month, now.day,
              selectedTime.hour, selectedTime.minute);
          onTimeChanged(dateTime);
        }

        onTimeChanged(selectedTime as DateTime);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shadowColor: Theme.of(context).colorScheme.secondary,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }

  Theme timePickerTheme(
      BuildContext context, ThemeData currentTheme, Widget? child) {
    return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            inverseSurface: currentTheme.colorScheme.inversePrimary,
            inversePrimary: currentTheme.colorScheme.inversePrimary,
            onSecondary: currentTheme.colorScheme.inversePrimary,
            onPrimary: currentTheme.colorScheme.background,
            onBackground: currentTheme.colorScheme.secondary,
            onSurface: currentTheme.colorScheme.inversePrimary,
            background: currentTheme.colorScheme.tertiary,
            secondary: currentTheme.colorScheme.inversePrimary,
            primary: currentTheme.colorScheme.inversePrimary,
            tertiary: currentTheme.colorScheme.inversePrimary,
          ),
          timePickerTheme: TimePickerThemeData(
            hourMinuteTextColor: currentTheme.colorScheme.inversePrimary,
            hourMinuteColor: currentTheme.colorScheme.secondary,
            dayPeriodTextColor: currentTheme.colorScheme.inversePrimary,
            dayPeriodColor: currentTheme.colorScheme.secondary,
            dialHandColor: currentTheme.colorScheme.inversePrimary,
            dialBackgroundColor: currentTheme.colorScheme.secondary,
            entryModeIconColor: currentTheme.colorScheme.inversePrimary,
            backgroundColor: currentTheme.colorScheme.background,
          ),
        ),
        child: child!);
  }
}
