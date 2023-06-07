import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        focusedDay: _focusedDay,
        firstDay: DateTime(2000),
        lastDay: DateTime(2030),
        calendarFormat: calendarFormat,
        startingDayOfWeek: StartingDayOfWeek.monday,
        daysOfWeekVisible: true,
        onDaySelected: (selectDay, focusDay) {
          setState(
            () {
              _selectedDay = selectDay;
              _focusedDay = focusDay;
            },
          );
        },
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
        onFormatChanged: (format) {
          setState(
            () {
              format = calendarFormat;
            },
          );
        },
        calendarStyle: const CalendarStyle(
          isTodayHighlighted: true,
          selectedDecoration: BoxDecoration(
            color: Colors.amber,
            shape: BoxShape.rectangle,
          ),
          todayDecoration: BoxDecoration(
            color: Colors.green,
          ),
          selectedTextStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
