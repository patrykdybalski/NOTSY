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
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        elevation: 0.6,
        shadowColor: Colors.black,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/note_card.png.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Expanded(
          child: RichText(
            maxLines: 3,
            text: TextSpan(
              text: widget.noteModel.title.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.primaryColor,
            child: const Icon(
              Icons.delete_forever_outlined,
              color: AppColors.redColor,
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.primaryColor,
            child: const Icon(
              Icons.mode_edit_outline_outlined,
              color: AppColors.accentColor,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            backgroundColor: AppColors.primaryColor,
            child: const Icon(
              Icons.keyboard_return_outlined,
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/note_card.png.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text(
                        'Utworzenie  23/07/2023',
                        style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        'Aktualizacja 23/07/2023',
                        style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Text(
                  widget.noteModel.subtitle,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
