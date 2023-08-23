import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/domain/repositories/calendar/events_repository.dart';
import 'package:primary_school/features/home/pages/calendar_page/edit_event_screen/cubit/edit_event_cubit.dart';
import 'package:primary_school/features/home/pages/calendar_page/edit_event_screen/edit_event_widgets.dart';

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
          TitleField(
            eventModel: eventModel,
            onTitleChanged: onTitleChanged,
          ),
          const SizedBox(
            height: 10,
          ),
          SubtitleField(
            eventModel: eventModel,
            onSubtitleChanged: onSubtitleChanged,
          ),
          const SizedBox(
            height: 20,
          ),
          DayButton(
              selectedDateFormatted: selectedDateFormatted,
              eventModel: eventModel,
              onDayChanged: onDayChanged),
          TimeButton(
              selectedTimeFormatted: selectedTimeFormatted,
              eventModel: eventModel,
              onTimeChanged: onTimeChanged),
        ],
      ),
    );
  }
}
