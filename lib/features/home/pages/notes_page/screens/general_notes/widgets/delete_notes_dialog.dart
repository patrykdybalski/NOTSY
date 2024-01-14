import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/general_notes/cubit/note_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/general_notes/widgets/note_item.dart';

class DeleteNotesDialog extends StatelessWidget {
  const DeleteNotesDialog({
    super.key,
    required this.widget,
  });

  final NoteItem widget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NoteCubit>()..start(),
      child: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.background,
            title: Text(AppLocalizations.of(context).deleteNote),
            titleTextStyle: TextStyles.textStyle2(
                20, Theme.of(context).colorScheme.inversePrimary),
            elevation: 20,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  AppLocalizations.of(context).no,
                  style: TextStyles.textStyle2(
                      16, Theme.of(context).colorScheme.inversePrimary),
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<NoteCubit>().remove(id: widget.noteModel.id);
                  Navigator.of(context).pop();
                },
                child: Text(
                  AppLocalizations.of(context).yes,
                  style: TextStyles.textStyle1(
                      16, Theme.of(context).colorScheme.inversePrimary),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
