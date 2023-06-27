import 'package:flutter/material.dart';
import 'package:primary_school/constans/colors.dart';
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
                AppColors.primaryColor,
                AppColors.primaryColor,
              ],
            ),
          ),
          child: ExpansionTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.access_time),
                Text(
                  eventModel.selectedTimeFormatted(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.dayColor,
                  ),
                ),
              ],
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Text(
                eventModel.title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.dayColor,
                ),
              ),
            ),
            trailing: Text(
              eventModel.selectedDayFormatted(),
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: AppColors.dayColor,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  eventModel.subtitle,
                  style: TextStyle(
                    color: AppColors.dayColor,
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
