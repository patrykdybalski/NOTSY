import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/features/home/pages/event_page/event_page/cubit/event_cubit.dart';

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
        vertical: 3,
        horizontal: 8,
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
          side: isEventDateExpired
              ? const BorderSide(width: 1.8, color: AppColors.redColor3)
              : const BorderSide(width: 1.4, color: AppColors.greenLoginColor),
        ),
        tilePadding: const EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 8.0,
        ),
        leading: CheckBoxWidget(isEventDateExpired, widget),
        title: TtileWidget(widget),
        trailing: SelectedDateWidget(widget),
        children: [
          SubtitleWidget(widget),
        ],
      ),
    );
  }
}

class TtileWidget extends StatelessWidget {
  const TtileWidget(
    this.widget, {
    super.key,
  });

  final EventWidget widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.eventModel.title,
      style: TextStyles.textStyle2(15),
    );
  }
}

class SubtitleWidget extends StatelessWidget {
  const SubtitleWidget(
    this.widget, {
    super.key,
  });

  final EventWidget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
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
    );
  }
}

class SelectedDateWidget extends StatelessWidget {
  const SelectedDateWidget(
    this.widget, {
    super.key,
  });

  final EventWidget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget(
    this.isEventDateExpired,
    this.widget, {
    super.key,
  });

  final bool isEventDateExpired;
  final EventWidget widget;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        highlightColor: AppColors.greenColor.withOpacity(0.2),
        icon: isEventDateExpired
            ? const Icon(
                Icons.indeterminate_check_box_outlined,
                color: AppColors.redColor3,
                size: 30,
              )
            : const Icon(
                Icons.check_box_outline_blank_outlined,
                color: AppColors.greenLoginColor,
                size: 30,
              ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Potwierdzasz jako ukończone?'),
                  actionsAlignment: MainAxisAlignment.end,
                  titleTextStyle: TextStyles.textStyle2(18),
                  elevation: 20,
                  backgroundColor: AppColors.whiteColor,
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Nie',
                        style: TextStyles.textStyle1(16),
                      ),
                    ),
                    BlocProvider(
                      create: (context) => getIt<EventCubit>(),
                      child: BlocBuilder<EventCubit, EventState>(
                        builder: (context, state) {
                          return TextButton(
                            onPressed: () {
                              context.read<EventCubit>().remove(
                                    documentID: widget.eventModel.id,
                                  );
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Tak',
                              style: TextStyles.textStyle1(16),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              });
        });
  }
}
