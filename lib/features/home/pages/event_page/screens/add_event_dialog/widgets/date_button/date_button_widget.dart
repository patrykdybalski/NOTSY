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
      onPressed: () async {
        final selectedDate = await showDatePicker(
          initialDatePickerMode: DatePickerMode.day,
          locale: const Locale("pl", "PL"),
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
