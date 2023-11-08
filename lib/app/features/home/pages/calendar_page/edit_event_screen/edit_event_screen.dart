import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:primary_school/app/features/home/pages/calendar_page/edit_event_screen/cubit/edit_event_cubit.dart';
import 'package:primary_school/app/features/home/pages/calendar_page/edit_event_screen/edit_event_widgets.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/data/remote_data_sources/event_remote_data_source.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/domain/repositories/event/events_repository.dart';

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
      create: (context) => EditEventCubit(EventsRepository(
        EventRemoteDataSource(),
      )),
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
            return AlertDialog(
              scrollable: true,
              titlePadding: const EdgeInsets.all(5),
              backgroundColor: AppColors.primaryColor,
              contentPadding: const EdgeInsets.only(
                top: 15.0,
                left: 10.0,
                right: 10.0,
              ),
              shadowColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
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
                    : DateFormat.Hm().format(
                        _selectedTime!,
                      ),
                selectedDateFormatted: _selectedDay == null
                    ? null
                    : DateFormat.yMd().format(
                        _selectedDay!,
                      ),
                eventModel: widget.eventModel,
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
                    )),
                TextButton(
                  onPressed: () {
                    final newTitle = _title ?? widget.eventModel.title;
                    final newSubtitle = _subtitle ?? widget.eventModel.subtitle;
                    final newSelectedDay =
                        _selectedDay ?? widget.eventModel.selectedDay;
                    final newSelectedTime =
                        _selectedTime ?? widget.eventModel.selectedTime;
                    context.read<EditEventCubit>().edit(
                          newTitle,
                          newSubtitle,
                          newSelectedDay,
                          newSelectedTime,
                          widget.eventModel.id,
                        );
                  },
                  child: Text(
                    'Zapisz edycję',
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
    return Column(
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
          onDayChanged: onDayChanged,
        ),
        TimeButton(
          selectedTimeFormatted: selectedTimeFormatted,
          eventModel: eventModel,
          onTimeChanged: onTimeChanged,
        ),
      ],
    );
  }
}
