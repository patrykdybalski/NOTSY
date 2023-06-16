import 'package:flutter/material.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/features/home/pages/add_event_page/add_event_page.dart';

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

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<EventModel> _getEventsfromDay(DateTime day) {
    return selectedEvents[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: () {
              _showDialog();
            },
            icon: const Icon(
              Icons.add_circle_outline_outlined,
              size: 35,
              color: Color(0xff01D68E),
            ),
            padding: const EdgeInsets.only(right: 5),
          ),
        ],
      ),
      backgroundColor: const Color(0xff0c1020),
      // backgroundColor: const Color.fromRGBO(38, 50, 56, 1),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: const BoxDecoration(
                  // color: Color.fromRGBO(38, 50, 56, 1),
                  color: Color(0xff0c1020),
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
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
                onPageChanged: (focusedDay) {
                  focusedDay = focusedDay;
                },
                onFormatChanged: (format) {
                  setState(
                    () {
                      calendarFormat = format;
                    },
                  );
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
                eventLoader: _getEventsfromDay,
              ),
            ),
          ),
          ..._getEventsfromDay(selectedDay).map((EventModel event) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(colors: [
                      const Color(0xff01D68E),
                      Colors.blueGrey.shade300,
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                  ),
                  child: ListTile(
                    title: (Text(event.title)),
                    subtitle: (Text(event.subtitle)),
                    leading: const Icon(Icons.add),
                  ),
                ),
              ))
        ],
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
  //         scrollable: true,
  //         titlePadding: const EdgeInsets.all(1),
  //         contentPadding: const EdgeInsets.all(10),
  //         backgroundColor: const Color(0xff0c1020),
  //         title: title(),
  //         content: content(),
  //       );
  //     },
  //   );
  // }

  // title() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       TextButton(
  //         child: const Text(
  //           'Anuluj',
  //           style: TextStyle(
  //             color: Color.fromARGB(181, 255, 139, 128),
  //           ),
  //         ),
  //         onPressed: () {
  //           Navigator.of(context).pop();
  //         },
  //       ),
  //       TextButton(
  //         child: const Text(
  //           'Dodaj',
  //           style: TextStyle(
  //             color: Color(0xff01D68E),
  //           ),
  //         ),
  //         onPressed: () {
  //           if (eventNameController.text.isEmpty) {
  //           } else {
  //             if (selectedEvents[selectedDay] != null) {
  //               selectedEvents[selectedDay]?.add(EventModel(
  //                   title: eventNameController.text,
  //                   subtitle: eventDescriptionController.text));
  //             } else {
  //               selectedEvents[selectedDay] = [
  //                 EventModel(
  //                     title: eventNameController.text,
  //                     subtitle: eventDescriptionController.text)
  //               ];
  //             }
  //           }
  //           Navigator.of(context).pop();
  //           eventNameController.clear();
  //           setState(() {});
  //           return;
  //         },
  //       ),
  //     ],
  //   );
  // }

  // content() {
  //   var checkBoxValue = false;
  //   return Container(
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Column(children: [
  //         TextFormField(
  //           autofocus: true,
  //           cursorColor: Colors.white10,
  //           cursorRadius: const Radius.circular(12),
  //           controller: eventNameController,
  //           style: const TextStyle(
  //             fontWeight: FontWeight.bold,
  //             color: Color.fromARGB(255, 212, 209, 209),
  //           ),
  //           decoration: InputDecoration(
  //             labelText: 'Temat',
  //             labelStyle: const TextStyle(
  //               color: Colors.white60,
  //               fontSize: 18,
  //             ),
  //             border: UnderlineInputBorder(
  //               borderRadius: BorderRadius.circular(12),
  //               borderSide: BorderSide.none,
  //             ),
  //             filled: true,
  //             fillColor: Colors.white10,
  //           ),
  //           keyboardType: TextInputType.text,
  //           maxLength: 40,
  //           maxLines: 1,
  //         ),
  //         const SizedBox(
  //           height: 10,
  //         ),
  //         Container(
  //           decoration: BoxDecoration(
  //             color: Colors.white10,
  //             borderRadius: BorderRadius.circular(12),
  //           ),
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 const Text(
  //                   'Szczegółowy opis',
  //                   style: TextStyle(
  //                     color: Colors.white60,
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 TextFormField(
  //                   cursorColor: Colors.white10,
  //                   cursorRadius: const Radius.circular(12),
  //                   controller: eventDescriptionController,
  //                   style: const TextStyle(
  //                     color: Colors.white,
  //                   ),
  //                   decoration: InputDecoration(
  //                     border: UnderlineInputBorder(
  //                       borderSide: BorderSide.none,
  //                       borderRadius: BorderRadius.circular(12),
  //                     ),
  //                   ),
  //                   keyboardType: TextInputType.text,
  //                   maxLines: 4,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 20,
  //         ),
  //         TextFormField(
  //           cursorColor: Colors.white10,
  //           cursorRadius: const Radius.circular(12),
  //           style: const TextStyle(
  //             color: Colors.white,
  //             fontSize: 17,
  //           ),
  //           decoration: InputDecoration(
  //             prefixIcon: const Icon(
  //               Icons.calendar_month_outlined,
  //             ),
  //             prefixIconColor: Colors.white70,
  //             // labelText: 'Wybrana data z kalendarza',
  //             // labelStyle: const TextStyle(
  //             //   color: Colors.white60,
  //             //   fontWeight: FontWeight.normal,
  //             // ),

  //             border: UnderlineInputBorder(
  //               borderRadius: BorderRadius.circular(12),
  //               borderSide: BorderSide.none,
  //             ),
  //             filled: true,
  //             fillColor: Colors.white10,
  //           ),
  //         ),
  //         CheckboxListTile(
  //           activeColor: Colors.blue,
  //           controlAffinity: ListTileControlAffinity.leading,
  //           title: const Text(
  //             'Dodaj godzinę',
  //             style: TextStyle(
  //               color: Colors.white,
  //             ),
  //           ),
  //           value: checkBoxValue,
  //           onChanged: (value) {
  //             setState(() {
  //               checkBoxValue = value!;
  //             });
  //           },
  //         ),
  //         Row(
  //           children: [
  //             Expanded(
  //               child: MyInputFields(
  //                 title: 'Początek',
  //                 hint: '12:00',
  //                 widget: IconButton(
  //                   onPressed: () {},
  //                   icon: const Icon(
  //                     Icons.access_time_rounded,
  //                     color: Colors.grey,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(
  //               width: 10,
  //             ),
  //             Expanded(
  //               child: MyInputFields(
  //                 title: 'Koniec',
  //                 hint: '13:00',
  //                 widget: IconButton(
  //                   onPressed: () {},
  //                   icon: const Icon(
  //                     Icons.access_time_rounded,
  //                     color: Colors.grey,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ]),
  //     ),
  //   );
  // }

  CalendarStyle calendarStyle() {
    return CalendarStyle(
      canMarkersOverflow: true,
      outsideDaysVisible: false,
      outsideTextStyle: const TextStyle(
        color: Colors.black54,
        fontSize: 20,
      ),
      isTodayHighlighted: true,
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
      headerPadding: const EdgeInsets.all(1),
      titleCentered: true,
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


// calendarBuilders: CalendarBuilders(
//               selectedBuilder: (context, date, events) {
//                 return Container(
//                   margin: const EdgeInsets.all(4.0),
//                   alignment: Alignment.center,
//                   decoration: const BoxDecoration(
//                     color: Color.fromARGB(
//                       255,
//                       27,
//                       189,
//                       108,
//                     ),
//                     shape: BoxShape.circle,
//                   ),
//                   child: Text(
//                     date.day.toString(),
//                     style: const TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                 );
//               },
//               todayBuilder: (context, date, events) {
//                 return Container(
//                   margin: const EdgeInsets.all(4.0),
//                   alignment: Alignment.center,
//                   decoration: const BoxDecoration(
//                     color: Color.fromARGB(255, 167, 221, 116),
//                     shape: BoxShape.circle,
//                   ),
//                   child: Text(
//                     date.day.toString(),
//                     style: const TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                 );
//               },
//             ),