import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat calendarFormat = CalendarFormat.month;

  DateTime selectedDay = DateTime.now();

  DateTime focusedDay = DateTime.now();

  List<dynamic> Function(DateTime)? eventLoader;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: focusedDay,
      firstDay: DateTime(2022),
      lastDay: DateTime(2030),
      calendarFormat: calendarFormat,
      startingDayOfWeek: StartingDayOfWeek.monday,
      daysOfWeekVisible: true,
      daysOfWeekHeight: 30,
      rowHeight: 60,
      headerStyle: headerStyle(),
      calendarStyle: calendarStyle(),
      daysOfWeekStyle: daysOfWeekStyle(),
      eventLoader: eventLoader,
      onFormatChanged: (format) {
        setState(
          () {
            calendarFormat = format;
          },
        );
      },
      onPageChanged: (focusedDay) {
        focusedDay = focusedDay;
      },
      onDaySelected: (date, events) {
        setState(
          () {},
        );
      },
      selectedDayPredicate: (day) {
        return isSameDay(selectedDay, day);
      },
    );
  }

  CalendarStyle calendarStyle() {
    return CalendarStyle(
      canMarkersOverflow: true,
      outsideDaysVisible: false,
      isTodayHighlighted: true,
      outsideTextStyle: const TextStyle(
        color: Colors.black54,
        fontSize: 20,
      ),
      selectedDecoration: const BoxDecoration(
        color: Color(0xff01D68E),
        shape: BoxShape.circle,
      ),
      selectedTextStyle: const TextStyle(
        fontSize: 20,
      ),
      todayDecoration: BoxDecoration(
        color: Colors.blueGrey.shade300,
        shape: BoxShape.circle,
      ),
      todayTextStyle: const TextStyle(
        fontSize: 20,
      ),
      weekendTextStyle: const TextStyle(
        color: Color.fromARGB(181, 255, 139, 128),
        fontSize: 20,
      ),
      defaultTextStyle: const TextStyle(
        color: Colors.white60,
        fontSize: 20,
      ),
      rowDecoration: BoxDecoration(
        color: const Color(0xff0c1020),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  DaysOfWeekStyle daysOfWeekStyle() {
    return const DaysOfWeekStyle(
      decoration: BoxDecoration(
        color: Color(0xff0c1020),
      ),
      weekdayStyle: TextStyle(
        color: Colors.white60,
        fontSize: 12,
      ),
      weekendStyle: TextStyle(
        color: Color.fromARGB(181, 255, 139, 128),
        fontSize: 12,
      ),
    );
  }

  HeaderStyle headerStyle() {
    return HeaderStyle(
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.blueGrey.shade300,
      ),
      titleCentered: true,
      headerPadding: const EdgeInsets.all(1),
      leftChevronIcon: Icon(
        Icons.chevron_left_outlined,
        size: 30,
        color: Colors.blueGrey.shade300,
      ),
      rightChevronIcon: Icon(
        Icons.chevron_right_outlined,
        size: 30,
        color: Colors.blueGrey.shade300,
      ),
      formatButtonTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      formatButtonDecoration: BoxDecoration(
          color: Colors.blueGrey.shade300,
          border: const Border.fromBorderSide(BorderSide()),
          borderRadius: const BorderRadius.all(Radius.circular(12.0))),
    );
  }
}
