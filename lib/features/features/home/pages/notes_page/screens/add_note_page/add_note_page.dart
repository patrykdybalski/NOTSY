import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/constans/fonts_style.dart';
import 'package:primary_school/features/features/home/pages/notes_page/screens/add_note_page/add_page_buttons.dart';
import 'package:primary_school/features/features/home/pages/notes_page/screens/add_note_page/cubit/add_note_cubit.dart';



class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

String? _title;
String? _subtitle;
DateTime _createdDate = DateTime.now();
DateTime _updatedDate = DateTime.now();
Color _selectedColor = AppColors.primaryColor;

class _AddNotePageState extends State<AddNotePage> {
  @override
  void initState() {
    super.initState();
    _selectedColor =
        AppColors.primaryColor; // Ustawienie domyślnego koloru na początku
  }

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
      child: BlocListener<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state.saved) {
            startNewNote(); // Zerowanie pól po zapisaniu
            Navigator.of(context).popUntil((route) => route.isFirst);
          }

          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.errorMessage,
              ),
              backgroundColor: AppColors.redColor,
            ));
          }
        },
        child: BlocBuilder<AddNoteCubit, AddNoteState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColors.primaryColor,
              floatingActionButton: AddPageButtons(
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
                selectedColor: _selectedColor,
              ),
            );
          },
        ),
      ),
    );
  }

  void colorPickerDialog(BuildContext context) => showModalBottomSheet(
        context: context,
        useSafeArea: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        showDragHandle: true,
        backgroundColor: AppColors.primaryColor,
        builder: (context) {
          return Container(
            height: 220,
            padding: const EdgeInsets.all(16.0),
            color: AppColors.primaryColor,
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

class _AddNotePageBody extends StatelessWidget {
  const _AddNotePageBody({
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
    return Container(
      decoration: BoxDecoration(
        color: selectedColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            TextField(
              onChanged: onTitleChanged,
              minLines: 1,
              maxLines: 4,
              maxLength: 120,
              autofocus: true,
              style: TextStyles.textStyle2(18),
              decoration: const InputDecoration(
                counterText: '',
                hintText: 'Tytuł',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.redColor,
                    width: 1.2,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.redColor,
                    width: 0.8,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: onSubtitleChange,
              minLines: 1,
              maxLines: 200,
              style: TextStyles.textStyle1(18),
              decoration: const InputDecoration(
                hintText: 'Wpisz treść notatki',
                border: InputBorder.none,
              ),
            )
          ],
        ),
      ),
    );
  }
}
