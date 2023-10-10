import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/features/home/pages/notes_page/cubit/note_cubit.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/constans/font_style.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(NoteRepository()),
      child: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            appBar: AppBar(
              title: const Text('Mój profil'),
              titleTextStyle: TextStyles.headingStyle,
              centerTitle: true,
              backgroundColor: AppColors.primaryColor,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://png.pngtree.com/png-clipart/20210915/ourlarge/pngtree-user-avatar-placeholder-white-blue-png-image_3918443.jpg'),
                    maxRadius: 60,
                  ),
                  const Text(
                    '" Zaczyanj "',
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black87,
                    ),
                    height: 200,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<NoteCubit>().signOut();
                    },
                    child: const Text('Wyloguj'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
