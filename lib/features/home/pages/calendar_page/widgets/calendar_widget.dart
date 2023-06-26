import 'package:flutter/material.dart';
import 'package:primary_school/constans/colors.dart';
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
      daysOfWeekHeight: 15,
      rowHeight: 40,
      headerStyle: headerStyle(),
      calendarStyle: calendarStyle(),
      daysOfWeekStyle: daysOfWeekStyle(),
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
      selectedDayPredicate: (day) {
        return isSameDay(selectedDay, day);
      },
      onDaySelected: (selectedDayy, focusedDayy) {
        setState(
          () {
            selectedDay = selectedDayy;
            focusedDay = focusedDayy;
          },
        );
      },
    );
  }

  CalendarStyle calendarStyle() {
    return CalendarStyle(
      outsideDaysVisible: false,
      isTodayHighlighted: true,
      outsideTextStyle: const TextStyle(
        color: Colors.black54,
        fontSize: 15,
      ),
      selectedDecoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1, color: Colors.white38),
      ),
      selectedTextStyle: const TextStyle(
        fontSize: 15,
        color: AppColors.selectedDayColor,
      ),
      todayDecoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
          width: 1,
          color: Colors.white38,
        ),
      ),
      todayTextStyle: const TextStyle(
        fontSize: 15,
        color: AppColors.dayColor,
      ),
      weekendTextStyle: const TextStyle(
        color: Color.fromARGB(181, 255, 139, 128),
        fontSize: 15,
      ),
      defaultTextStyle: const TextStyle(
        color: Colors.white60,
        fontSize: 15,
      ),
      rowDecoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  DaysOfWeekStyle daysOfWeekStyle() {
    return const DaysOfWeekStyle(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
      ),
      weekdayStyle: TextStyle(
        color: AppColors.dayColor,
        fontSize: 12,
      ),
      weekendStyle: TextStyle(
        color: AppColors.weekendColor,
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
