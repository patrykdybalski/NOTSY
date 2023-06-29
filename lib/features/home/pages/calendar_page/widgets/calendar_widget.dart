import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    super.key,
  });

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  List<EventModel> events = [];

  List<EventModel> eventLoader(DateTime day) {
    return events.where((event) => event.selectedDay == day).toList();
  }

  List<EventModel> eventLoadeer(DateTime day) {
    return eventLoader(day);
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: focusedDay,
      weekendDays: const [DateTime.saturday, DateTime.sunday],
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
      eventLoader: eventLoadeer,
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
      outsideTextStyle: const TextStyle(
        color: Colors.black54,
        fontSize: 15,
      ),
      defaultTextStyle: const TextStyle(
        color: Color.fromRGBO(234, 232, 227, 1.0),
      ),
      selectedDecoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF7BA2B),
            Color(0xFFEA5358),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        shape: BoxShape.circle,
      ),
      selectedTextStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(234, 232, 227, 1.0),
      ),
      isTodayHighlighted: true,
      todayDecoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1,
          color: AppColors.accentColor,
        ),
      ),
      todayTextStyle: const TextStyle(
        fontSize: 15,
        color: AppColors.dayColor,
      ),
      weekendTextStyle: const TextStyle(
        color: AppColors.redColor,
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
        color: AppColors.redColor,
        fontSize: 12,
      ),
    );
  }

  HeaderStyle headerStyle() {
    return HeaderStyle(
      titleTextFormatter: (date, locale) {
        return DateFormat.yMMMMd(locale).format(date);
      },
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: AppColors.accentColor,
      ),
      titleCentered: false,
      headerPadding: const EdgeInsets.all(1),
      leftChevronIcon: const Icon(
        Icons.chevron_left_outlined,
        size: 30,
        color: AppColors.accentColor,
      ),
      rightChevronIcon: const Icon(
        Icons.chevron_right_outlined,
        size: 30,
        color: AppColors.accentColor,
      ),
      formatButtonShowsNext: false,
      formatButtonPadding: EdgeInsets.all(1),
      formatButtonTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.dayColor,
      ),
      formatButtonDecoration: const BoxDecoration(
        color: AppColors.primaryColor,
        border: Border.fromBorderSide(BorderSide(
          color: AppColors.dayColor,
        )),
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
    );
  }
}
