import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/add_note_screen/cubit/add_note_cubit.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/add_note_screen/widgets/add_note_screen_buttons.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

String? _title;
String? _subtitle;
DateTime _createdDate = DateTime.now();
DateTime _updatedDate = DateTime.now();
Color _selectedColor = Colors.grey.shade700;

class _AddNoteScreenState extends State<AddNoteScreen> {
  void startNewNote() {
    setState(() {
      _title = null;
      _subtitle = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddNoteCubit>(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state.saved) {
            startNewNote(); // Zerowanie pól po zapisaniu
            Navigator.of(context).popUntil((route) => route.isFirst);
          }

          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.errorMessage,
                style: TextStyles.textStyle2(
                  14,
                  Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              backgroundColor: Theme.of(context).colorScheme.error,
            ));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primary,
            floatingActionButton: AddNoteScreenButtons(
              context: context,
              title: _title,
              subtitle: _subtitle,
              createdDate: _createdDate,
              updatedDate: _updatedDate,
              selectedColor: _selectedColor,
              colorPickerDialog: colorPickerDialog,
            ).buildFabButtons(context),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterFloat,
            body: _AddNoteScreenBody(
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
              selectedColor: _selectedColor,
            ),
          );
        },
      ),
    );
  }

  void colorPickerDialog(BuildContext context) => showModalBottomSheet(
        context: context,
        useSafeArea: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        showDragHandle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        builder: (context) {
          return Container(
            height: 110,
            padding: const EdgeInsets.all(16.0),
            color: Theme.of(context).colorScheme.primary,
            child: buildColorPicekr(),
          );
        },
      );

  Widget buildColorPicekr() {
    return BlockPicker(
        pickerColor: _selectedColor,
        availableColors: AppColors.availableColors,
        onColorChanged: (newColor) {
          setState(() {
            _selectedColor = newColor;
          });
        });
  }
}

class _AddNoteScreenBody extends StatelessWidget {
  const _AddNoteScreenBody({
    Key? key,
    required this.onTitleChanged,
    required this.onSubtitleChange,
    required this.selectedColor, // Dodano selectedColor
  }) : super(key: key);

  final Function(String?) onTitleChanged;
  final Function(String?) onSubtitleChange;
  final Color selectedColor; // Dodano selectedColor

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
          TextField(
            onChanged: onTitleChanged,
            minLines: 1,
            maxLines: 4,
            maxLength: 120,
            autofocus: true,
            cursorColor: Theme.of(context).colorScheme.inversePrimary,
            style: TextStyles.textStyle2(
              18,
              selectedColor,
            ),
            decoration: InputDecoration(
              counterText: '',
              hintText: 'Tytuł',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  width: 0.8,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  width: 0.8,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            onChanged: onSubtitleChange,
            cursorColor: Theme.of(context).colorScheme.inversePrimary,
            minLines: 1,
            maxLines: 200,
            style: TextStyles.textStyle1(
              18,
              Theme.of(context).colorScheme.inversePrimary,
            ),
            decoration: const InputDecoration(
              hintText: 'Wpisz treść notatki',
              border: InputBorder.none,
            ),
          )
        ],
      ),
    );
  }
}
