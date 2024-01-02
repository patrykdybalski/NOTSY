import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/features/home/pages/event_page/event_page/cubit/event_cubit.dart';
import 'package:primary_school/features/home/pages/event_page/event_page/widgets/event_widget.dart';

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
      style: TextStyles.textStyle2(14),
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
                color: AppColors.secondaryColor,
              ),
            ),
          ),
          child: Text(widget.eventModel.subtitle,
              style: TextStyles.textStyle1(17)),
        ),
      ],
    );
  }
}

class SelectedDateWidget extends StatelessWidget {
  const SelectedDateWidget(
    this.widget,
    this.isEventDateExpired, {
    super.key,
  });

  final EventWidget widget;
  final bool isEventDateExpired;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${widget.eventModel.selectedDayFormatted2()} ${widget.eventModel.selectedDayFormatted()} ',
          style: isEventDateExpired
              ? TextStyles.textStyleRed2(13)
              : TextStyles.textStyle2(13),
        ),
        Text(
          widget.eventModel.selectedTimeFormatted(),
          style: isEventDateExpired
              ? TextStyles.textStyleRed2(13)
              : TextStyles.textStyleGreen2(13),
        ),
      ],
    );
  }
}

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget(
    this.widget, {
    super.key,
  });

  final EventWidget widget;

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

bool? isChecked = false;

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: isChecked,
        tristate: false,
        activeColor: AppColors.greenColor,
        onChanged: (newBool) {
          setState(() {
            isChecked = newBool;
          });
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Potwierdzasz jako ukończone?'),
                  actionsAlignment: MainAxisAlignment.end,
                  titleTextStyle: TextStyles.textStyle2(18),
                  elevation: 10,
                  backgroundColor: AppColors.primaryColor,
                  actions: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isChecked = false;
                        });
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
                                    documentID: widget.widget.eventModel.id,
                                  );
                              Navigator.of(context).pop();
                              setState(() {
                                isChecked = false;
                              });
                            },
                            child: Text(
                              'Tak',
                              style: TextStyles.textStyleGreen1(16),
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
