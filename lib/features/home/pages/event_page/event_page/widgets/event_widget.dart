import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
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
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                  color: AppColors.primaryColor3,
                  blurRadius: 1,
                  offset: Offset(0, 1)),
              BoxShadow(
                  color: AppColors.primaryColor3,
                  blurRadius: 0.2,
                  offset: Offset(2, 0))
            ]),
        child: ExpansionTile(
          initiallyExpanded: false,
          backgroundColor: AppColors.primaryColor3,
          collapsedBackgroundColor: AppColors.primaryColor3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: const BorderSide(
              color: AppColors.primaryColor,
              width: 0.1,
            ),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
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
