import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/constans/font_style.dart';
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
            width: 0.6,
          ),
        ),
        collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              width: 1.2,
              color: AppColors.accentColor,
            )),
        leading: const Icon(
          Icons.task_alt_outlined,
          color: AppColors.redColor,
        ),
        title: Padding(
          padding: const EdgeInsets.only(
            top: 4.0,
            bottom: 4.0,
          ),
          child: Text(
            widget.eventModel.title,
            style: TextStyles.eventWidgetTextStyle1,
          ),
        ),
        trailing: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.eventModel.selectedDayFormatted(),
                style: TextStyles.eventWidgetTextStyle2,
              ),
              Text(
                "${widget.eventModel.selectedDayFormatted2()}, ${widget.eventModel.selectedTimeFormatted()}",
                style: GoogleFonts.domine(
                  color: AppColors.secondaryColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,

                  // Dodaj tutaj inne właściwości stylu tekstu dla nagłówków.
                ),
              ),
            ],
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              right: 25,
              top: 10,
              bottom: 25,
            ),
            child: Row(
              children: [
                Container(
                  width: 280,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide.none,
                      left: BorderSide(
                        color: AppColors.accentColor,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      bottom: 10,
                      right: 40,
                    ),
                    child: Text(
                      widget.eventModel.subtitle,
                      style: GoogleFonts.domine(
                        color: AppColors.secondaryColor,
                        fontSize: 16,

                        // Dodaj tutaj inne właściwości stylu tekstu dla nagłówków.
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
