import 'package:flutter/material.dart';
import 'package:primary_school/models/input_field.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatelessWidget {
  AddTaskPage({
    super.key,
  });
  final DateTime _selectedDateNow = DateTime.now();
  final String _startTime =
      DateFormat("hh:mm a").format(DateTime.now()).toString();
  final String _endTime = '9:30';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: Column(
              children: [
                const MyInputFields(
                  title: 'Tytuł',
                  hint: 'Wpisz tutył tutaj',
                ),
                const MyInputFields(
                  title: 'Data',
                  hint: 'Wpisz tutył tutaj',
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyInputFields(
                        title: 'Start',
                        hint: '11:12',
                        widget: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: MyInputFields(
                        title: 'Start',
                        hint: _startTime,
                        widget: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const MyInputFields(
                  title: 'Tytuł',
                  hint: 'Wpisz tutył tutaj',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
