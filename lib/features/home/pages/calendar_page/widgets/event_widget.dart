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
      child: Container(
        padding: const EdgeInsets.only(
          right: 1,
          left: 5,
          bottom: 1,
          top: 1,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 0.5,
          ),
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
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(9.0),
              bottomRight: Radius.circular(9.0),
            ),
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
                  fontWeight: FontWeight.w300,
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
                      top: BorderSide(
                        color: Colors.white,
                        width: 0.1,
                      ),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        Colors.black12,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accentColor,
                        blurRadius: 1,
                        offset: Offset(0, 3),
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 3,
                      ),
                      // BoxShadow(
                      //   color: AppColors.secondaryColor,
                      //   blurRadius: 2,
                      //   offset: Offset(1, 1),
                      //   blurStyle: BlurStyle.outer,
                      //   spreadRadius: 1,
                      // ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      left: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                        left: 5.0,
                      ),
                      child: Text(
                        widget.eventModel.subtitle,
                        style: const TextStyle(
                          color: AppColors.dayColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
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
