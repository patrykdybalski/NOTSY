import 'package:flutter/material.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({
    required this.eventModel,
    super.key,
  });

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.blueGrey.shade700,
        ),
        child: ExpansionTile(
          title: Text(
            eventModel.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                '16:45',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '17:24',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          children: [
            Text(eventModel.subtitle),
            Text(
              eventModel.selectedDayFormatted(),
            )
          ],
        ),
      ),
    );
  }
}
