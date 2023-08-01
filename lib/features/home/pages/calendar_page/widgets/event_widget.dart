import 'package:flutter/material.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';


class EventWidget extends StatefulWidget {
  const EventWidget({
    required this.eventModel,
    super.key,
  });

  final EventModel eventModel;

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 5,
      ),
      child: ExpansionTile(
        initiallyExpanded: false,
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: const BorderSide(
            color: AppColors.redColor,
            width: 0.5,
          ),
        ),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.access_time,
              color: AppColors.accentColor,
              weight: 10.0,
            ),
            Text(
              widget.eventModel.selectedTimeFormatted(),
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 15,
                color: AppColors.dayColor,
              ),
            ),
          ],
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
          child: Text(
            widget.eventModel.title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.dayColor,
            ),
          ),
        ),
        trailing: Text(
          widget.eventModel.selectedDayFormatted(),
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w300,
            color: AppColors.dayColor,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              right: 25,
              top: 15,
              bottom: 25,
            ),
            child: Container(
              width: 280,
              decoration: const BoxDecoration(
                border: Border(
                  // left: BorderSide(
                  //   style: BorderStyle.solid,
                  //   color: AppColors.secondaryColor,
                  //   width: 0.5,
                  // ),
                  top: BorderSide.none,
                  left: BorderSide(
                    color: AppColors.accentColor,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  left: 10,
                  bottom: 10,
                ),
                child: Text(
                  widget.eventModel.subtitle,
                  style: const TextStyle(
                    color: AppColors.dayColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
