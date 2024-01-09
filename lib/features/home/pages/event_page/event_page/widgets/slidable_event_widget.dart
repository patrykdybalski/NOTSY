import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/features/home/pages/event_page/event_page/widgets/delete_event_slidable_action.dart';
import 'package:primary_school/features/home/pages/event_page/event_page/widgets/edit_event_slidable_action.dart';
import 'package:primary_school/features/home/pages/event_page/event_page/widgets/event_widget.dart';

class SlidableEventWidget extends StatelessWidget {
  const SlidableEventWidget({
    super.key,
    required this.eventModel,
  });

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(eventModel.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableActionWidgets().deleteAction(context, eventModel),
          EditEventSlidableAction(eventModel: eventModel),
        ],
      ),
      child: EventWidget(eventModel),
    );
  }
}
