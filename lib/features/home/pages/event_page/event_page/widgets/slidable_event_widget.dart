import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/features/home/pages/event_page/event_page/cubit/event_cubit.dart';
import 'package:primary_school/features/home/pages/event_page/event_page/widgets/event_widget.dart';
import 'package:primary_school/features/home/pages/event_page/screens/edit_event_screen/edit_event_screen.dart';

class SlidableEventWidget extends StatelessWidget {
  const SlidableEventWidget({
    super.key,
    required this.eventModel,
  });

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(eventModel.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              showDialog(
                context: context,
                builder: ((context) {
                  return AlertDialog(
                    title: const Text('Usunąć wybraną pozycję?'),
                    titleTextStyle: TextStyles.textStyle2(20),
                    elevation: 20,
                    backgroundColor: AppColors.primaryColor,
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
                                      documentID: eventModel.id,
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
                }),
              );
            },
            borderRadius: BorderRadius.circular(16),
            padding: const EdgeInsets.all(2),
            label: 'Usuń',
            icon: Icons.task_alt_outlined,
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.redColor,
            spacing: 5,
          ),
          SlidableAction(
            onPressed: (context) {
              _showEditDialog(context);
            },
            label: 'Edytuj',
            icon: Icons.mode_edit_outline_outlined,
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.secondaryColor,
            spacing: 5,
            borderRadius: BorderRadius.circular(16),
          ),
        ],
      ),
      child: EventWidget(
        eventModel,
      ),
    );
  }

  _showEditDialog(context) {
    showDialog(
        useSafeArea: true,
        context: context,
        builder: (context) {
          return EditEventScreen(
            eventModel: eventModel,
          );
        });
  }
}
