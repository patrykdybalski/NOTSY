import 'package:flutter/material.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/features/home/pages/event_page/screens/edit_event_screen/widgets/date_button/date_button_widget.dart';
import 'package:primary_school/features/home/pages/event_page/screens/edit_event_screen/widgets/subtitle_widget/subtitle_widget.dart';
import 'package:primary_school/features/home/pages/event_page/screens/edit_event_screen/widgets/time_button/time_button_widget.dart';
import 'package:primary_school/features/home/pages/event_page/screens/edit_event_screen/widgets/title_widget/title_widget.dart';

class ContentDialog extends StatelessWidget {
  const ContentDialog({
    super.key,
    required this.onTitleChanged,
    required this.onSubtitleChanged,
    required this.onDayChanged,
    required this.onTimeChanged,
    required this.selectedTimeFormatted,
    required this.selectedDateFormatted,
    required this.eventModel,
  });

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
        EditTitleWidget(
          eventModel: eventModel,
          onTitleChanged: onTitleChanged,
        ),
        const SizedBox(height: 16),
        EditSubtitleWidget(
          eventModel: eventModel,
          onSubtitleChanged: onSubtitleChanged,
        ),
        const SizedBox(height: 8),
        EditDateButton(
          selectedDateFormatted: selectedDateFormatted,
          eventModel: eventModel,
          onDayChanged: onDayChanged,
        ),
        const SizedBox(height: 8),
        EditTimeButton(
          selectedTimeFormatted: selectedTimeFormatted,
          eventModel: eventModel,
          onTimeChanged: onTimeChanged,
        ),
      ],
    );
  }
}
