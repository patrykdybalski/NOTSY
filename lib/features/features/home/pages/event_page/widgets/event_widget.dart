import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/constans/fonts_style.dart';
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
        left: 8,
        right: 8,
        bottom: 6,
      ),
      child: ExpansionTile(
        initiallyExpanded: false,
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: const BorderSide(
            color: AppColors.redColor,
            width: 0.6,
          ),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            width: 1.2,
            color: AppColors.accentColor,
          ),
        ),
        tilePadding: const EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 8.0,
        ),
        leading: const Icon(
          Icons.task_alt_outlined,
          color: AppColors.redColor,
        ),
        title: Text(
          widget.eventModel.title,
          style: TextStyles.textStyle2(15),
        ),
        trailing: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 2.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.eventModel.selectedDayFormatted(),
                style: TextStyles.textStyle2(13),
              ),
              Text(
                "${widget.eventModel.selectedDayFormatted2()}, ${widget.eventModel.selectedTimeFormatted()}",
                style: GoogleFonts.domine(
                  color: AppColors.secondaryColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8,
                  top: 8,
                  bottom: 8,
                ),
                margin: const EdgeInsets.only(
                  left: 24.0,
                  right: 8,
                  bottom: 24,
                ),
                width: 290,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide.none,
                    left: BorderSide(
                      color: AppColors.accentColor,
                    ),
                  ),
                ),
                child: Text(
                  widget.eventModel.subtitle,
                  style: GoogleFonts.domine(
                    color: AppColors.secondaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
