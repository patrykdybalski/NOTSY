import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:primary_school/data/remote_data_sources_firebase/event_remote_data_source.dart';
import 'package:primary_school/domain/repositories/event/event_repository.dart';
import 'package:primary_school/features/home/pages/event_page/screens/add_event_dialog/cubit/add_event_cubit.dart';
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
  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddEventCubit(EventRepository(
        EventRemoteDataSource(),
      )),
      child: BlocBuilder<AddEventCubit, AddEventState>(
        builder: (context, state) {
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
        },
      ),
    );
  }

  CalendarStyle calendarStyle() {
    return CalendarStyle(
      outsideDaysVisible: false,
      defaultTextStyle: const TextStyle(
        color: Colors.white,
      ),
      selectedDecoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
        ),
        shape: BoxShape.circle,
      ),
      selectedTextStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      isTodayHighlighted: true,
      todayDecoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
      ),
      todayTextStyle: const TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),
      weekendTextStyle: const TextStyle(
        color: Colors.white,
      ),
      rowDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  DaysOfWeekStyle daysOfWeekStyle() {
    return const DaysOfWeekStyle(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      weekdayStyle: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
      weekendStyle: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    );
  }

  HeaderStyle headerStyle() {
    return HeaderStyle(
      titleTextFormatter: (date, locale) {
        return DateFormat.yMMMM(locale).format(date);
      },
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
        color: Colors.white,
      ),
      titleCentered: true,
      headerPadding: const EdgeInsets.all(1),
      leftChevronIcon: const Icon(
        Icons.chevron_left_outlined,
        size: 25,
        color: Colors.white,
      ),
      rightChevronIcon: const Icon(
        Icons.chevron_right_outlined,
        size: 25,
        color: Colors.white,
      ),
      formatButtonShowsNext: true,
      formatButtonPadding: const EdgeInsets.all(5),
      formatButtonTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontSize: 10,
      ),
      formatButtonDecoration: const BoxDecoration(
        color: Colors.white,
        border: Border.fromBorderSide(
          BorderSide(
            color: Colors.white,
            width: 0.5,
          ),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
    );
  }
}
