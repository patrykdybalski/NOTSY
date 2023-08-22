import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/note_reader_screen/cubit/reader_screen_cubit.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/note_reader_screen/note_reader_buttons.dart';

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
      create: (context) => ReaderScreenCubit(NoteRepository()),
      child: BlocListener<ReaderScreenCubit, ReaderScreenState>(
        listener: (context, state) {
          if (state.delete) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage,
                ),
                backgroundColor: AppColors.redColor,
              ),
            );
          }
        },
        child: BlocBuilder<ReaderScreenCubit, ReaderScreenState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: widget.noteModel.color,
              floatingActionButton: NoteReaderButtons(
                      context: context, noteModel: widget.noteModel)
                  .buildFabButtons(context),
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
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            const Divider(
              color: AppColors.secondaryColor,
              thickness: 0.8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text(
                      'utw. ${DateFormat('dd/MM/yyyy hh:mm').format(createdDate)}',
                      style: const TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 9,
                      ),
                    ),
                    Text(
                      'edt. ${DateFormat('dd/MM/yyyy hh:mm').format(updatedDate)}',
                      style: const TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 9,
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
              style: const TextStyle(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
