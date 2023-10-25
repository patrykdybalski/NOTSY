import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:primary_school/app/features/home/pages/calendar_page/add_event_dialog/add_event_widgets.dart';
import 'package:primary_school/app/features/home/pages/calendar_page/add_event_dialog/cubit/add_event_cubit.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/data/remote_data_sources/event_remote_data_source.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/domain/repositories/event/events_repository.dart';

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
  Map<DateTime, List<EventModel>> events = {};
  late final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddEventCubit(EventsRepository(EventRemoteDataSource(),)),
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
              backgroundColor: AppColors.primaryColor,
              contentPadding: const EdgeInsets.only(
                top: 15.0,
                left: 10.0,
                right: 10.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              shadowColor: null,
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
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actionsPadding: const EdgeInsets.only(
                top: 0,
                bottom: 3.0,
                left: 5,
                right: 5,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Anuluj',
                    style: GoogleFonts.domine(
                      color: AppColors.redColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
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
                  child: Text(
                    'Zapisz',
                    style: GoogleFonts.domine(
                      color: AppColors.accentColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
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
    return Column(
      children: [
        TitleWidget(
          onTitleChanged: onTitleChanged,
        ),
        const SizedBox(
          height: 10,
        ),
        SubtitleWidget(
          onSubtitleChanged: onSubtitleChanged,
        ),
        const SizedBox(
          height: 15,
        ),
        DayButton(
          selectedDateFormatted: selectedDateFormatted,
          onDayChanged: onDayChanged,
        ),
        TimeButton(
          selectedTimeFormatted: selectedTimeFormatted,
          onTimeChanged: onTimeChanged,
        ),
      ],
    );
  }
}
