import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/features/home/pages/event_page/screens/edit_event_screen/edit_event_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditEventSlidableAction extends StatelessWidget {
  const EditEventSlidableAction({
    super.key,
    required this.eventModel,
  });

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) {
        showDialog(
            useSafeArea: true,
            context: context,
            builder: (context) {
              return EditEventScreen(
                eventModel: eventModel,
              );
            });
      },
      label: AppLocalizations.of(context).edit,
      icon: Icons.mode_edit_outline_outlined,
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      spacing: 5,
      borderRadius: BorderRadius.circular(16),
    );
  }
}
