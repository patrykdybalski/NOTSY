import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/domain/repositories/calendar/events_repository.dart';
import 'package:primary_school/features/home/pages/calendar_page/edit_event_screen/cubit/edit_event_cubit.dart';

class EditEventScreen extends StatefulWidget {
  const EditEventScreen({
    required this.eventModel,
    super.key,
  });
  final EventModel eventModel;

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  String? _title;
  String? _subtitle;
  DateTime? _selectedDay;
  DateTime? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditEventCubit(EventsRepository()),
      child: BlocListener<EditEventCubit, EditEventState>(
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
        child: BlocBuilder<EditEventCubit, EditEventState>(
          builder: (context, state) {
            return Container(
              color: AppColors.primaryColor,
              child: AlertDialog(
                scrollable: true,
                titlePadding: const EdgeInsets.all(1),
                contentPadding: const EdgeInsets.all(5),
                backgroundColor: AppColors.primaryColor,
                shadowColor: AppColors.primaryColor,
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
                  eventModel: widget.eventModel,
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
                        onPressed: () {
                          final newTitle = _title ?? '';
                          final newSubtitle = _subtitle ?? '';
                          final newSelectedDay = _selectedDay ?? '' as DateTime;
                          final newSelectedTime =
                              _selectedTime ?? '' as DateTime;
                          context.read<EditEventCubit>().edit(
                                newTitle,
                                newSubtitle,
                                newSelectedDay,
                                newSelectedTime,
                                widget.eventModel.id,
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
    required this.eventModel,
  }) : super(key: key);

  final Function(String?) onTitleChanged;
  final Function(String?) onSubtitleChanged;
  final Function(DateTime?) onDayChanged;
  final Function(DateTime?) onTimeChanged;
  final String? selectedDateFormatted;
  final String? selectedTimeFormatted;
  final EventModel eventModel;

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
            initialValue: eventModel.title,
            onChanged: onTitleChanged,
            autofocus: true,
            maxLength: 50,
            maxLines: 2,
            minLines: 1,
            keyboardType: TextInputType.text,
            cursorColor: Colors.white10,
            cursorRadius: const Radius.circular(12),
            style: const TextStyle(
              color: AppColors.secondaryColor,
            ),
            decoration: InputDecoration(
              labelText: 'Temat',
              filled: true,
              fillColor: Colors.white10,
              labelStyle: const TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 18,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.redColor,
                    width: 1.0,
                  )),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.darkGreen,
                  width: 0.3,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.darkGreen,
                    width: 0.3,
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            initialValue: eventModel.subtitle,
            onChanged: onSubtitleChanged,
            keyboardType: TextInputType.multiline,
            maxLines: 10,
            minLines: 4,
            scrollPhysics:
                const ClampingScrollPhysics(), // Dodaj to, aby umożliwić przewijanie
            cursorColor: AppColors.secondaryColor,
            cursorRadius: const Radius.circular(12),
            style: const TextStyle(
              color: AppColors.secondaryColor,
            ),
            decoration: InputDecoration(
              enabled: true,
              labelText: 'Opis',
              labelStyle: const TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 18,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.redColor,
                    width: 1.0,
                  )),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.darkGreen,
                  width: 0.3,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.darkGreen,
                    width: 0.3,
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            label: Text(
              selectedDateFormatted ?? eventModel.selectedEditDayFormatted(),
              style: const TextStyle(
                color: AppColors.accentColor,
              ),
            ),
            icon: const Icon(
              Icons.calendar_month_outlined,
              color: AppColors.secondaryColor,
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
                width: 0.3,
              ),
              elevation: 1.5,
              shadowColor: AppColors.primaryColor,
            ),
            onPressed: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: eventModel.selectedDay,
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
              selectedTimeFormatted ?? eventModel.selectedTimeFormatted(),
              style: const TextStyle(
                color: AppColors.accentColor,
              ),
            ),
            icon: const Icon(
              Icons.more_time_rounded,
              color: AppColors.secondaryColor,
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
                width: 0.3,
              ),
              elevation: 1.5,
              shadowColor: AppColors.primaryColor,
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
