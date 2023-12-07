import 'package:flutter_test/flutter_test.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';

void main() {
  test('should selectedDayFormatted() return date/time with correct format ',
      () {
    final model = EventModel(
      title: 'Task',
      subtitle: 'Task description',
      selectedDay: DateTime(DateTime.now().year, 6, 23),
      selectedTime: DateTime(DateTime.now().year, 6, 23)
          .add(const Duration(hours: 10, minutes: 30, seconds: 15)),
      id: 'id',
    );
    final result1 = model.selectedDayFormatted();
    final result2 = model.selectedDayFormatted2();
    final result3 = model.selectedEditDayFormatted();
    final result4 = model.selectedTimeFormatted();

    expect(result1, 'June 23');
    expect(result2, 'Fri');
    expect(result3, '6/23/2023');
    expect(result4, '10:30');
  });
}
