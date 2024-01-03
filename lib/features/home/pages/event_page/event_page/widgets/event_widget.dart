import 'package:flutter/material.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/features/home/pages/event_page/event_page/widgets/event_widget_components.dart';

class EventWidget extends StatefulWidget {
  const EventWidget(
    this.eventModel, {
    super.key,
  });

  final EventModel eventModel;

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    bool isEventDateExpired = widget.eventModel.selectedDay
        .isBefore(DateTime.now().subtract(const Duration(days: 1)));

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: [
          BoxShadow(
              color: Theme.of(context).colorScheme.secondary,
              blurRadius: 0.7,
              offset: const Offset(1, 2)),
          BoxShadow(
              color: Theme.of(context).colorScheme.primary,
              blurRadius: 0.5,
              offset: const Offset(1, 0))
        ]),
        child: ExpansionTile(
          initiallyExpanded: false,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          collapsedBackgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          tilePadding: const EdgeInsets.symmetric(
            vertical: 3.0,
            horizontal: 3.0,
          ),
          leading: CheckBoxWidget(widget),
          title: TtileWidget(widget),
          trailing: SelectedDateWidget(widget, isEventDateExpired),
          children: [
            SubtitleWidget(widget),
          ],
        ),
      ),
    );
  }
}
