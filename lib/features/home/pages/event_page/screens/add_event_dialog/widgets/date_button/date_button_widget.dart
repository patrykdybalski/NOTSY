import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
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
      icon: const Icon(
        Icons.calendar_month_outlined,
        color: AppColors.secondaryColor,
      ),
      label: Text(
        selectedDateFormatted ?? 'Wybierz dzień',
        style: TextStyles.textStyle1(14),
      ),
      onPressed: () async {
        final selectedDate = await showDatePicker(
          initialEntryMode: DatePickerEntryMode.calendar,
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
        backgroundColor: AppColors.primaryColor3,
        shadowColor: AppColors.secondaryColor,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12.0,
          ),
        ),
      ),
    );
  }
}
