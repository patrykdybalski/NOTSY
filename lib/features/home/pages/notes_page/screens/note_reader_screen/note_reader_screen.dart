import 'package:flutter/material.dart';
import 'package:primary_school/constans/colors.dart';

import 'package:primary_school/domain/models/note_model/note_model.dart';

class NoteReaderScreen extends StatefulWidget {
  const NoteReaderScreen({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.6,
        shadowColor: Colors.black,
        title: Expanded(
          child: RichText(
            text: TextSpan(
              text: widget.noteModel.title.toString(),
              style: const TextStyle(
                color: AppColors.accentColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 10,
          top: 8,
          bottom: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: const [
                    Text(
                      'Utworzenie  23/07/2023',
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 9,
                      ),
                    ),
                    Text(
                      'Aktualizacja 23/07/2023',
                      style: TextStyle(
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
              height: 30,
            ),
            Text(
              widget.noteModel.subtitle,
              style: const TextStyle(
                color: AppColors.accentColor,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
