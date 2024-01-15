import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/features/home/pages/event_page/event_page/cubit/event_cubit.dart';
import 'package:primary_school/features/home/pages/event_page/event_page/widgets/event_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      style: TextStyles.textStyle2(
        16,
        Theme.of(context).colorScheme.inversePrimary,
      ),
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
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide.none,
              left: BorderSide(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          child: Text(widget.eventModel.subtitle,
              style: TextStyles.textStyle1(
                16,
                Theme.of(context).colorScheme.inversePrimary,
              )),
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
          '${widget.eventModel.selectedDayFormatted2()}${widget.eventModel.selectedDayFormatted()} ',
          style: isEventDateExpired
              ? TextStyles.textStyle2(14, Theme.of(context).colorScheme.error)
              : TextStyles.textStyle1(
                  13,
                  Theme.of(context).colorScheme.inversePrimary,
                ),
        ),
        Text(
          widget.eventModel.selectedTimeFormatted(),
          style: isEventDateExpired
              ? TextStyles.textStyle2(
                  13,
                  Theme.of(context).colorScheme.error,
                )
              : TextStyles.textStyle1(
                  13,
                  Theme.of(context).colorScheme.inversePrimary,
                ),
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
        activeColor: Theme.of(context).colorScheme.tertiary,
        onChanged: (newBool) {
          setState(() {
            isChecked = newBool;
          });
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(AppLocalizations.of(context).markAsComplete),
                  actionsAlignment: MainAxisAlignment.end,
                  titleTextStyle: TextStyles.textStyle2(
                    20,
                    Theme.of(context).colorScheme.inversePrimary,
                  ),
                  elevation: 20,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  actions: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isChecked = false;
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        AppLocalizations.of(context).no,
                        style: TextStyles.textStyle1(
                          16,
                          Theme.of(context).colorScheme.inversePrimary,
                        ),
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
                              AppLocalizations.of(context).yes,
                              style: TextStyles.textStyle1(
                                16,
                                Theme.of(context).colorScheme.tertiary,
                              ),
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
