import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/features/home/pages/event_page/screens/edit_event_screen/widgets/content_dialog/content_dialog.dart';
import 'package:primary_school/features/home/pages/event_page/screens/edit_event_screen/widgets/save_edit_button/save_edit_button.dart';
import 'cubit/edit_event_cubit.dart';

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
      create: (context) => getIt<EditEventCubit>(),
      child: BlocConsumer<EditEventCubit, EditEventState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).pop();
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
          }
        },
        builder: (context, state) {
          return AlertDialog(
            scrollable: true,
            titlePadding: const EdgeInsets.all(5),
            surfaceTintColor: Colors.transparent,
            contentPadding: const EdgeInsets.only(
              top: 24.0,
              left: 16.0,
              right: 16.0,
              bottom: 24,
            ),
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actionsPadding: const EdgeInsets.only(
              top: 8,
              bottom: 3.0,
            ),
            content: ContentDialog(
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
            actions: [
              const BackEditButton(),
              SaveEditButton(
                title: _title,
                widget: widget,
                subtitle: _subtitle,
                selectedDay: _selectedDay,
                selectedTime: _selectedTime,
              ),
            ],
          );
        },
      ),
    );
  }
}


