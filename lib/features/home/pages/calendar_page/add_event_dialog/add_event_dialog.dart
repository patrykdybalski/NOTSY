import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/domain/repositories/calendar/events_repository.dart';
import 'package:primary_school/features/home/pages/calendar_page/add_event_dialog/cubit/add_event_cubit.dart';

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
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Anuluj',
                          style: TextStyle(
                            color: AppColors.redColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        )),
                    TextButton(
                      onPressed: //_title == null ||
                          //         _subtitle == null ||
                          //         _selectedDay == null ||
                          //         _selectedTime == null
                          //     ? null
                          () {
                        final newTitle = _title ?? '';
                        final newSubtitle = _subtitle ?? '';
                        final newSelectedDay = _selectedDay ?? '' as DateTime;
                        final newSelectedTime = _selectedTime ?? '' as DateTime;
                        context.read<AddEventCubit>().add(
                              newTitle,
                              newSubtitle,
                              newSelectedDay,
                              newSelectedTime,
                            );
                      },
                      child: const Text(
                        'Zapisz',
                        style: TextStyle(
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
      padding: const EdgeInsets.only(
        top: 15.0,
        left: 10.0,
        right: 10.0,
      ),
      child: Column(
        children: [
          TextFormField(
            textAlign: TextAlign.justify,
            onChanged: onTitleChanged,
            autofocus: true,
            keyboardType: TextInputType.text,
            maxLength: 50,
            maxLines: 2,
            minLines: 1,
            cursorColor: Colors.white10,
            cursorRadius: const Radius.circular(12),
            style: const TextStyle(
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.w700,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white10,
              labelText: 'Temat',
              labelStyle: const TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 18,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.redColor,
                    width: 1,
                  )),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.darkGreen,
                    width: 0.3,
                  )),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.darkGreen,
                  width: 0.6,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            onChanged: onSubtitleChanged,
            keyboardType: TextInputType.multiline,
            scrollPhysics:
                const ClampingScrollPhysics(), // Dodaj to, aby umożliwić przewijanie
            maxLines: 10,
            minLines: 4,
            cursorColor: AppColors.secondaryColor,
            cursorRadius: const Radius.circular(12),
            style: const TextStyle(
              color: AppColors.secondaryColor,
            ),
            decoration: InputDecoration(
              hintText: 'Opis',
              labelStyle: const TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.redColor,
                    width: 1,
                  )),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.darkGreen,
                    width: 0.3,
                  )),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.darkGreen,
                  width: 0.3,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.calendar_month_outlined,
              color: AppColors.secondaryColor,
            ),
            label: Text(
              selectedDateFormatted ?? 'Wybierz dzień',
              style: const TextStyle(
                color: AppColors.secondaryColor,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              elevation: 1.5,

              shadowColor: AppColors.accentColor, // Kolor tła przycisku
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  8.0,
                ), // Opcjonalnie: zaokrąglenie rogów przycisku
              ),
            ),
            onPressed: () async {
              final selectedDate = await showDatePicker(
                initialEntryMode: DatePickerEntryMode.calendarOnly,
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
            icon: const Icon(
              Icons.more_time_rounded,
              color: AppColors.secondaryColor,
            ),
            label: Text(
              selectedTimeFormatted ?? 'Dodaj godzinę',
              style: const TextStyle(
                color: AppColors.secondaryColor,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              elevation: 2,
              shadowColor: AppColors.accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
              ),
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
