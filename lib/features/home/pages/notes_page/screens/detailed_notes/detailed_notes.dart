import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';
import 'package:primary_school/features/home/pages/notes_page/cubit/note_cubit.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/note_reader_screen/note_reader_screen.dart';

class DetailedNotesScreen extends StatefulWidget {
  const DetailedNotesScreen({super.key});

  @override
  State<DetailedNotesScreen> createState() => _DetailedNotesScreenState();
}

class _DetailedNotesScreenState extends State<DetailedNotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocProvider(
        create: (context) => NoteCubit()..start(),
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

class NoteItem extends StatefulWidget {
  const NoteItem({
    required this.noteModel,
    super.key,
  });

  final NoteModel noteModel;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                NoteReaderScreen(noteModel: widget.noteModel)));
      },
      child: Column(
        children: [
          Container(
            height: 200,
            width: 175,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(0),
              ),
              border: Border.all(
                color: AppColors.secondaryColor,
                width: 0.3,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 6,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.noteModel.title,
                          style: const TextStyle(
                            color: AppColors.accentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: AppColors.redColor,
                    thickness: 0.3,
                    height: 7,
                  ),
                  Expanded(
                    child: Text(
                      widget.noteModel.subtitle,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        color: AppColors.accentColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
