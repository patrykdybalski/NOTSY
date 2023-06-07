import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        focusedDay: DateTime.now(),
        firstDay: DateTime(2000),
        lastDay: DateTime(2030),
      ),
    );
  }
}
