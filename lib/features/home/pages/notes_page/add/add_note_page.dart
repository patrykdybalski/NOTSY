import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/constans/colors.dart';
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
      child: BlocListener<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).pop();
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.errorMessage,
              ),
              backgroundColor: Colors.red,
            ));
          }
        },
        child: BlocBuilder<AddNoteCubit, AddNoteState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColors.primaryColor,
              floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: AppColors.primaryColor,
                    child: const Icon(
                      Icons.mode_edit_outline_outlined,
                      color: AppColors.redColor,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _title == null || _subtitle == null
                        ? null
                        : () {
                            context.read<AddNoteCubit>().add(
                                  _title!,
                                  _subtitle!,
                                );
                          },
                    backgroundColor: AppColors.primaryColor,
                    child: const Icon(
                      Icons.check_outlined,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    backgroundColor: AppColors.primaryColor,
                    child: const Icon(
                      Icons.keyboard_return_outlined,
                      color: AppColors.accentColor,
                    ),
                  ),
                ],
              ),
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
              ),
            );
          },
        ),
      ),
    );
  }
}

// class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   Size get preferredSize =>
//       Size.fromHeight(kToolbarHeight * 1.3); // Wysokość AppBara

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       automaticallyImplyLeading: false,
//       flexibleSpace: Container(
//         height: 130,
//         padding: EdgeInsets.symmetric(horizontal: 16),
//         alignment: Alignment.bottomCenter, // Wyśrodkowujemy zawartość na dole
//         child: TextField(
//           maxLines: 3,
//           minLines: 1,
//           decoration: InputDecoration(
//             hintText: 'Tutaj wpisz swój tekst',
//             border: InputBorder.none,
//           ),
//           style: TextStyle(
//             color: AppColors.accentColor,
//             fontSize: 12,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyTextField extends StatelessWidget {
//   const MyTextField({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 40.0),
//       child: TextField(
//         maxLines: 3,
//         minLines: 1, // Ograniczamy TextField do maksymalnie trzech linii
//         decoration: InputDecoration(
//           hintText: 'Tutaj wpisz swój tekst', // Placeholder dla TextField
//           border: InputBorder.none, // Usuwamy obramowanie TextField
//         ),
//         style: TextStyle(color: Colors.white, fontSize: 18),
//       ),
//     );
//   }
// }

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
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 10.0,
        top: 8.0,
      ),
      child: ListView(
        children: [
          TextField(
            onChanged: onTitleChanged,
            minLines: 1,
            maxLines: 2,
            maxLength: 120,
            style: const TextStyle(
              color: AppColors.accentColor,
              fontWeight: FontWeight.w700,
            ),
            decoration: const InputDecoration(
              counterText: '',
              hintText: 'Tytuł',
              border: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.accentColor, width: 1.0),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.accentColor, width: 1.0),
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
            style: const TextStyle(
              color: AppColors.accentColor,
              fontWeight: FontWeight.w300,
              fontSize: 20,
            ),
            decoration: const InputDecoration(
              hintText: 'Opis',
              border: InputBorder.none,
            ),
          )
        ],
      ),
    );
  }
}
