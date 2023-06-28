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
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFF7BA2B),
              Color(0xFFEA5358),
            ],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.secondaryColor,
                  AppColors.primaryColor,
                  AppColors.primaryColor,
                  AppColors.primaryColor,
                  AppColors.primaryColor,
                  AppColors.primaryColor,
                  AppColors.primaryColor,
                ]),
          ),
          child: ExpansionTile(
            initiallyExpanded: false,
            backgroundColor: AppColors.primaryColor,
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.access_time,
                  color: AppColors.dayColor,
                ),
                Text(
                  widget.eventModel.selectedTimeFormatted(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
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
                  fontWeight: FontWeight.bold,
                  color: AppColors.dayColor,
                ),
              ),
            ),
            trailing: Text(
              widget.eventModel.selectedDayFormatted(),
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: AppColors.dayColor,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 25.0,
                  right: 25,
                  top: 15,
                  bottom: 15,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.eventModel.subtitle),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
