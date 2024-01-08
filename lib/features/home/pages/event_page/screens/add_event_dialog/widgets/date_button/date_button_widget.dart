import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';

class DayButton extends StatelessWidget {
  const DayButton({
    super.key,
    required this.selectedDateFormatted,
    required this.onDayChanged,
  });

  final String? selectedDateFormatted;
  final Function(DateTime?) onDayChanged;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        final selectedDate = await showDatePicker(
          initialDatePickerMode: DatePickerMode.day,
          locale: const Locale("pl", "PL"),
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(3000),
          builder: (BuildContext context, Widget? child) {
            return datePickerTheme(context, child);
          },
        );

        onDayChanged(selectedDate);
      },
      icon: Icon(
        Icons.calendar_month_outlined,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      label: Text(
        selectedDateFormatted ?? 'Wybierz dzień',
        style: TextStyles.textStyle1(
          14,
          Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shadowColor: Theme.of(context).colorScheme.secondary,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12.0,
          ),
        ),
      ),
    );
  }

  Theme datePickerTheme(BuildContext context, Widget? child) {
    return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            inverseSurface: Theme.of(context).colorScheme.inversePrimary,
            inversePrimary: Theme.of(context).colorScheme.inversePrimary,
            onSecondary: Theme.of(context).colorScheme.inversePrimary,
            onPrimary: Theme.of(context).colorScheme.background,
            onBackground: Theme.of(context).colorScheme.secondary,
            onSurface: Theme.of(context).colorScheme.inversePrimary,
            background: Theme.of(context).colorScheme.tertiary,
            secondary: Theme.of(context).colorScheme.inversePrimary,
            primary: Theme.of(context).colorScheme.inversePrimary,
            tertiary: Theme.of(context).colorScheme.inversePrimary,
          ),
          datePickerTheme: DatePickerThemeData(
            dayStyle: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            headerBackgroundColor: Theme.of(context).colorScheme.secondary,
            backgroundColor: Theme.of(context).colorScheme.background,
            headerForegroundColor: Theme.of(context).colorScheme.inversePrimary,
            surfaceTintColor: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        child: child!);
  }
}
