import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart'; // Import do lokalizacji formatowania daty
import 'package:intl/intl.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';

void main() {
  setUp(() {
    // Set the locale to English for consistency in date formatting
    Intl.defaultLocale = 'pl_PL';
    initializeDateFormatting();
  });
  test('should selectedDayFormatted() return date/time with correct format ',
      () {
    final model = EventModel(
      title: 'Task',
      subtitle: 'Task description',
      selectedDay: DateTime(DateTime.now().year, 6, 23),
      selectedTime: DateTime(DateTime.now().year, 6, 23, 10, 30),
      id: 'id',
    );
    final result1 = model.selectedDayFormatted();
    final result2 = model.selectedDayFormatted2();
    final result3 = model.selectedEditDayFormatted();
    final result4 = model.selectedTimeFormatted();

    expect(result1, '23.06');
    expect(result2, 'niedz.');
    expect(result3, '23.06.2024');
    expect(result4, '10:30');
  });
}
