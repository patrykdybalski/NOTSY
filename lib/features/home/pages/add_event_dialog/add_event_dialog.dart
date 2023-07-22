import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:primary_school/constans/colors.dart';
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
            return AlertDialog(
              scrollable: true,
              titlePadding: const EdgeInsets.all(1),
              contentPadding: const EdgeInsets.all(5),
              backgroundColor: AppColors.primaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_circle_left_outlined,
                      color: AppColors.redColor,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  IconButton(
                    onPressed: _title == null ||
                            _subtitle == null ||
                            _selectedDay == null ||
                            _selectedTime == null
                        ? null
                        : () {
                            context.read<AddEventCubit>().add(
                                  _title!,
                                  _subtitle!,
                                  _selectedDay!,
                                  _selectedTime!,
                                );
                          },
                    icon: const Icon(
                      Icons.add_circle_outline_sharp,
                      color: AppColors.greenColor,
                      size: 30,
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
                selectedTimeFormatted: _selectedTime == null
                    ? null
                    : DateFormat.Hm().format(_selectedTime!),
                selectedDateFormatted: _selectedDay == null
                    ? null
                    : DateFormat.yMd().format(_selectedDay!),
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
            textAlign: TextAlign.justify,
            onChanged: onTitleChanged,
            autofocus: true,
            cursorColor: Colors.white10,
            cursorRadius: const Radius.circular(12),
            style: const TextStyle(
              color: AppColors.dayColor,
            ),
            decoration: InputDecoration(
              labelText: 'Temat',
              labelStyle: const TextStyle(
                color: AppColors.dayColor,
                fontSize: 18,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.dayColor,
                    width: 1.5,
                  )),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.dayColor,
                ),
              ),
              filled: true,
              fillColor: Colors.white10,
            ),
            keyboardType: TextInputType.text,
            maxLength: 50,
            maxLines: 2,
            minLines: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            onChanged: onSubtitleChanged,
            cursorColor: Colors.white10,
            cursorRadius: const Radius.circular(12),
            style: const TextStyle(
              color: AppColors.dayColor,
            ),
            decoration: InputDecoration(
              enabled: true,
              labelText: 'Opis',
              labelStyle: const TextStyle(
                color: AppColors.dayColor,
                fontSize: 18,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.dayColor,
                    width: 1.5,
                  )),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.dayColor,
                ),
              ),
            ),
            keyboardType: TextInputType.text,
            maxLines: 10,
            minLines: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            label: Text(
              selectedDateFormatted ?? 'Wybierz dzień',
              style: const TextStyle(
                color: AppColors.accentColor,
              ),
            ),
            icon: const Icon(
              Icons.calendar_month_outlined,
              color: AppColors.accentColor,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor, // Kolor tła przycisku
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  8.0,
                ), // Opcjonalnie: zaokrąglenie rogów przycisku
              ),
              side: const BorderSide(
                color: AppColors.secondaryColor,
                width: 1,
              ),
              elevation: 1.5,
              shadowColor: AppColors.accentColor,
            ),
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
          ),
          ElevatedButton.icon(
            label: Text(
              selectedTimeFormatted ?? 'Dodaj godzinę',
              style: const TextStyle(
                color: AppColors.accentColor,
              ),
            ),
            icon: const Icon(
              Icons.more_time_rounded,
              color: AppColors.accentColor,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
              ),
              side: const BorderSide(
                color: AppColors.secondaryColor,
                width: 1,
              ),
              elevation: 1.5,
              shadowColor: AppColors.accentColor,
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
