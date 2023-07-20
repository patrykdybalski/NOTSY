import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/features/home/pages/notes_page/add/cubit/add_note_cubit.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

String? _title;
String? _subtitle;

class _AddNotePageState extends State<AddNotePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocBuilder<AddNoteCubit, AddNoteState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('dodaj notatkę'),
              actions: [
                IconButton(
                    onPressed: _title == null || _subtitle == null
                        ? null
                        : () {
                            context.read<AddNoteCubit>().add(
                                  _title!,
                                  _subtitle!,
                                );
                          },
                    icon: const Icon(
                      Icons.check,
                    )),
              ],
            ),
            body: _AddNotePageBody(
              onTitleChanged: (newValue) {
                setState(() {
                  _title = newValue;
                });
              },
              onSubtitleChange: (newValue) {
                setState(() {
                  _subtitle = newValue;
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class _AddNotePageBody extends StatelessWidget {
  const _AddNotePageBody({
    Key? key,
    required this.onTitleChanged,
    required this.onSubtitleChange,
  }) : super(key: key);

  final Function(String) onTitleChanged;
  final Function(String) onSubtitleChange;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextField(
          onChanged: onTitleChanged,
        ),
        TextField(
          onChanged: onSubtitleChange,
        )
      ],
    );
  }
}
