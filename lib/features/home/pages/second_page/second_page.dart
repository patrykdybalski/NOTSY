import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
