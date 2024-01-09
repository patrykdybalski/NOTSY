import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/features/home/pages/event_page/event_page/cubit/event_cubit.dart';

class SlidableActionWidgets {
  SlidableAction deleteAction(BuildContext context, EventModel eventModel) {
    return SlidableAction(
      onPressed: (context) {
        showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              title: const Text('Usunąć wybraną pozycję?'),
              titleTextStyle: TextStyles.textStyle2(
                20,
                Theme.of(context).colorScheme.inversePrimary,
              ),
              elevation: 20,
              backgroundColor: Theme.of(context).colorScheme.background,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Nie',
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
                                documentID: eventModel.id,
                              );
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Tak',
                          style: TextStyles.textStyle2(
                            16,
                            Theme.of(context).colorScheme.inversePrimary,
                          ),
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
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.error,
      spacing: 5,
    );
  }
}
