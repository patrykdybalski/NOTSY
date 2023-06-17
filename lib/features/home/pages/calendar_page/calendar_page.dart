import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/features/home/pages/add_event_page/add_event_page.dart';
import 'package:primary_school/features/home/pages/calendar_page/cubit/calendar_cubit.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  late Map<DateTime, List<EventModel>> selectedEvents;
  List<EventModel> _getEventsfromDay(DateTime day) {
    return selectedEvents[day] ?? [];
  }

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0c1020),
      appBar: AppBar(
        title: const Text('Kalendarz'),
        centerTitle: true,
        backgroundColor: const Color(0xff0c1020),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline_outlined,
              size: 35,
              color: Color(0xff01D68E),
            ),
            padding: const EdgeInsets.only(right: 5),
            onPressed: () {
              _showDialog();
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => CalendarCubit()..start(),
        child: BlocBuilder<CalendarCubit, CalendarState>(
          builder: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              return Center(
                child: Text(
                  'Coś poszło nie tak: ${state.errorMessage}',
                ),
              );
            }
            if (state.isLoading) {
              return const CircularProgressIndicator();
            }
            final calendarItems = state.calendarItems;

            return ListView(
              children: [
                for (final calendarItem in calendarItems) ...[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff0c1020),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: TableCalendar(
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
                        eventLoader: _getEventsfromDay,
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
                        onDaySelected: (selectDay, focusDay) {
                          setState(
                            () {
                              selectedDay = selectDay;
                              focusedDay = focusDay;
                            },
                          );
                        },
                        selectedDayPredicate: (day) {
                          return isSameDay(selectedDay, day);
                        },
                      ),
                    ),
                  ),
                  ..._getEventsfromDay(selectedDay)
                      .map((EventModel event) => Column(
                            children: [
                              Text(calendarItem['title']),
                              Text(calendarItem['subtitle']),
                              Text(calendarItem['selectedDay'].toString()),
                            ],
                          )),
                ],
              ],
            );
          },
        ),
      ),
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return const AddEventDialog();
        });
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
