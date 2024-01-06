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
          builder: (BuildContext context, Widget? child) {
            return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    inverseSurface:
                        Theme.of(context).colorScheme.inversePrimary,
                    inversePrimary:
                        Theme.of(context).colorScheme.inversePrimary,
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
                    headerBackgroundColor:
                        Theme.of(context).colorScheme.secondary,
                    backgroundColor: Theme.of(context).colorScheme.background,
                    headerForegroundColor:
                        Theme.of(context).colorScheme.inversePrimary,
                    surfaceTintColor:
                        Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                child: child!);
          },
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
