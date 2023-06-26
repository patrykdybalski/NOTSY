import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:primary_school/domain/repositories/events_repository.dart';
import 'package:primary_school/features/home/pages/add_event_dialog/cubit/add_event_cubit.dart';

class AddEventDialog extends StatefulWidget {
  const AddEventDialog({
    super.key,
  });

  @override
  State<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  String? _title;
  String? _subtitle;
  DateTime? _selectedDay;
  DateTime? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddEventCubit(EventsRepository()),
      child: BlocListener<AddEventCubit, AddEventState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).pop();
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<AddEventCubit, AddEventState>(
          builder: (context, state) {
            return Container(
              color: Colors.amberAccent,
              width: 250,
              height: 300,
              child: AlertDialog(
                scrollable: true,
                titlePadding: const EdgeInsets.all(1),
                contentPadding: const EdgeInsets.all(10),
                backgroundColor: const Color(0xff0c1020),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: const Text(
                        'Anuluj',
                        style: TextStyle(
                          color: Color.fromARGB(181, 255, 139, 128),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      onPressed: _title == null ||
                              _subtitle == null ||
                              _selectedDay == null
                          ? null
                          : () {
                              context.read<AddEventCubit>().add(
                                    _title!,
                                    _subtitle!,
                                    _selectedDay!,
                                    _selectedTime!,
                                  );
                            },
                      child: const Text(
                        'Dodaj',
                        style: TextStyle(
                          color: Color(0xff01D68E),
                        ),
                      ),
                    ),
                  ],
                ),
                content: _ContentDialog(
                  onTitleChanged: (newValue) {
                    setState(
                      () {
                        _title = newValue;
                      },
                    );
                  },
                  onSubtitleChanged: (newValue) {
                    setState(
                      () {
                        _subtitle = newValue;
                      },
                    );
                  },
                  onDayChanged: (newValue) {
                    setState(
                      () {
                        _selectedDay = newValue;
                      },
                    );
                  },
                  onTimeChanged: (newValue) {
                    setState(() {
                      _selectedTime = newValue;
                    });
                  },
                  selectedTimeFormatted:
                      _selectedTime == null ? null : '$_selectedTime',
                  selectedDateFormatted: _selectedDay == null
                      ? null
                      : DateFormat.MMMEd().format(_selectedDay!),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ContentDialog extends StatelessWidget {
  const _ContentDialog({
    Key? key,
    required this.onTitleChanged,
    required this.onSubtitleChanged,
    required this.onDayChanged,
    required this.onTimeChanged,
    required this.selectedTimeFormatted,
    required this.selectedDateFormatted,
  }) : super(key: key);

  final Function(String) onTitleChanged;
  final Function(String) onSubtitleChanged;
  final Function(DateTime?) onDayChanged;
  final Function(DateTime?) onTimeChanged;
  final String? selectedDateFormatted;
  final String? selectedTimeFormatted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            onChanged: onTitleChanged,
            autofocus: true,
            cursorColor: Colors.white10,
            cursorRadius: const Radius.circular(12),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 212, 209, 209),
            ),
            decoration: InputDecoration(
              labelText: 'Temat',
              labelStyle: const TextStyle(
                color: Colors.white60,
                fontSize: 18,
              ),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white10,
            ),
            keyboardType: TextInputType.text,
            maxLength: 45,
            maxLines: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Szczegółowy opis',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    onChanged: onSubtitleChanged,
                    cursorColor: Colors.white10,
                    cursorRadius: const Radius.circular(12),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  const Duration(days: 365 * 10),
                ),
              );
              onDayChanged(selectedDate);
            },
            child: Text(
              selectedDateFormatted ?? 'Wybierz dzień',
            ),
          ),
          ElevatedButton(
            child: Text(
              selectedTimeFormatted ?? 'Dodaj godzinę',
            ),
            onPressed: () async {
              TimeOfDay? selectedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (selectedTime != null) {
                DateTime now = DateTime.now();
                DateTime dateTime = DateTime(now.year, now.month, now.day,
                    selectedTime.hour, selectedTime.minute);
                onTimeChanged(dateTime);
              }
            },
          ),
        ],
      ),
    );
  }
}
