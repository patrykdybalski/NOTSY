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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime(2022),
            lastDay: DateTime(2030),
            calendarFormat: calendarFormat,
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekVisible: true,

            headerStyle: HeaderStyle(
              rightChevronPadding: const EdgeInsets.all(1.0),
              titleCentered: true,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
            ),

            //style Calendar
            calendarStyle: CalendarStyle(
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
              ),
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
              ),
              selectedTextStyle: const TextStyle(
                color: Colors.black,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.amber.shade200,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
              ),
              todayTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              weekendTextStyle: const TextStyle(
                color: Colors.red,
              ),
              defaultTextStyle: const TextStyle(color: Colors.purpleAccent),
              tablePadding: const EdgeInsets.all(5),
              rowDecoration: const BoxDecoration(
                color: Color.fromARGB(115, 228, 183, 183),
              ),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(20),
              ),
              weekdayStyle: const TextStyle(
                color: Colors.blue,
              ),
              weekendStyle: const TextStyle(
                color: Colors.red,
              ),
            ),

            onDaySelected: (date, events) {
              setState(
                () {
                  print(date.toIso8601String());
                },
              );
            },
            calendarBuilders: CalendarBuilders(
              selectedBuilder: (context, date, events) {
                return Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(
                      255,
                      27,
                      189,
                      108,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    date.day.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
              todayBuilder: (context, date, events) {
                return Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 167, 221, 116),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    date.day.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            onFormatChanged: (format) {
              setState(
                () {
                  calendarFormat = format;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
