import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/general_notes/cubit/note_cubit.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/general_notes/widgets/note_item.dart';

class GeneralNotes extends StatefulWidget {
  const GeneralNotes({super.key});

  @override
  State<GeneralNotes> createState() => _GeneralNotesState();
}

class _GeneralNotesState extends State<GeneralNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocProvider(
        create: (context) => getIt<NoteCubit>()..start(),
        child: BlocBuilder<NoteCubit, NoteState>(
          builder: (context, state) {
            final noteModels = state.noteItems;
            switch (state.status) {
              case Status.initial:
                return const Center(
                  child: Text('Initial state'),
                );
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.success:
                return GridView(
                  reverse: false,
                  padding: const EdgeInsets.all(10),
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.8,
                  ),
                  children: [
                    for (final noteModel in noteModels) ...[
                      NoteItem(
                        noteModel: noteModel,
                      ),
                    ],
                  ],
                );
              case Status.error:
                return Center(
                  child: Text(
                    state.errorMessage ?? 'Unknown error',
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
