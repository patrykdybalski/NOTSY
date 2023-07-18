import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/features/home/pages/notes_page/cubit/note_cubit.dart';

class GeneralNotes extends StatefulWidget {
  const GeneralNotes({super.key});

  @override
  State<GeneralNotes> createState() => _GeneralNotesState();
}

class _GeneralNotesState extends State<GeneralNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0c1020),
      body: BlocProvider(
        create: (context) => NoteCubit(),
        child: BlocBuilder<NoteCubit, NoteState>(
          builder: (context, state) {
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  scrollDirection: Axis.vertical,
                  
                  children: [
                    for (final document in state.documents) ...[
                      const NoteItem(
                          title: 'title',
                          subtitle:
                              'subtitle please make a video  fin java for android'),
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

class NoteItem extends StatelessWidget {
  const NoteItem({
    required this.title,
    required this.subtitle,
    super.key,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5.0,
        right: 5.0,
        top: 8.0,
      ),
      child: Column(
        children: [
          Container(
            width: 180,
            height: 25,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                border: Border.all(
                  color: Colors.white30,
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4,
              ),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  border: Border.all(color: Colors.white30, width: 0.5)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
