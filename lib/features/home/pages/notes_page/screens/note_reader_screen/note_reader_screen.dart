import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/note_reader_screen/widgets/note_reader_buttons.dart';

import 'cubit/reader_screen_cubit.dart';

class NoteReaderScreen extends StatefulWidget {
  const NoteReaderScreen({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReaderScreenCubit>(),
      child: BlocConsumer<ReaderScreenCubit, ReaderScreenState>(
        listener: (context, state) {
          if (state.delete) {
            Navigator.of(context).popUntil(
              (route) => route.isFirst,
            );
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage,
                  style: TextStyles.textStyle2(
                    14,
                    Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            floatingActionButton: NoteReaderButtons(
              context: context,
              noteModel: widget.noteModel,
            ).buildFabButtons(context),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterFloat,
            body: NoteReaderScreenBody(
              title: widget.noteModel.title,
              subtitle: widget.noteModel.subtitle,
              createdDate: widget.noteModel.createdDate,
              updatedDate: widget.noteModel.updatedDate,
              color: widget.noteModel.color,
              id: widget.noteModel.id,
            ),
          );
        },
      ),
    );
  }
}

class NoteReaderScreenBody extends StatelessWidget {
  const NoteReaderScreenBody({
    super.key,
    required this.title,
    required this.subtitle,
    required this.createdDate,
    required this.updatedDate,
    required this.color,
    required this.id,
  });

  final String title;
  final String subtitle;
  final DateTime createdDate;
  final DateTime updatedDate;
  final Color color;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Text(
              title,
              style: GoogleFonts.roboto(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
              thickness: 0.8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text(
                      'utw. ${DateFormat('dd/MM/yyyy hh:mm').format(createdDate)}',
                      style: TextStyles.textStyle1(
                        9,
                        Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    Text(
                      'edt. ${DateFormat('dd/MM/yyyy hh:mm').format(updatedDate)}',
                      style: TextStyles.textStyle1(
                        9,
                        Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              subtitle,
              style: TextStyles.textStyle1(
                18,
                Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
