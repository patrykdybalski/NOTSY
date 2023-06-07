import 'package:flutter/material.dart';
import 'package:primary_school/domain/models/input_field.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({
    super.key,
  });

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDateNow = DateTime.now();

  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();

  String _endTime = '9:30';
  final int _selectedRemind = 5;
  List<int> remindList = [
    5,
    10,
    15,
    20,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyInputFields(
                title: 'Tytuł',
                hint: 'Wpisz tutył tutaj',
              ),
              MyInputFields(
                title: 'Data',
                hint: DateFormat.yMd().format(_selectedDateNow),
                widget: IconButton(
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    _getDateFromUser();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyInputFields(
                      title: 'Start',
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(
                            isStartTime: true,
                          );
                        },
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: MyInputFields(
                      title: 'Koniec',
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(
                            isStartTime: false,
                          );
                        },
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              MyInputFields(
                title: 'Przypomnienie',
                hint: '$_selectedRemind minut wcześniej',
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getDateFromUser() async {
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2035),
    );
    if (pickerDate != null) {
      setState(() {
        _selectedDateNow = pickerDate;
      });
    } else {}
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String formatedTime = pickedTime.format();
    if (pickedTime == null) {
    } else if (isStartTime == true) {
      setState(() {
        _startTime = formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(_startTime.split(":")[0]),
        minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
      ),
    );
  }
}
