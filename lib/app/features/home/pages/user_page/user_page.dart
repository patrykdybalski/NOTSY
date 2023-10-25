import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primary_school/app/features/home/pages/user_page/cubit/user_page_cubit.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/constans/font_style.dart';
import 'package:primary_school/data/remote_data_sources/login_auth_data_source.dart';

import 'package:primary_school/domain/repositories/login_auth/login_auth_repository.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserPageCubit(LoginAuthRepository(
        LoginAuthDataSource(),
      )),
      child: BlocBuilder<UserPageCubit, UserPageState>(
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/login_page_logo.png'),
                    radius: 80,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<UserPageCubit>().signOut();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                    ),
                    child: Text('Wyloguj',
                        style: GoogleFonts.domine(
                          color: AppColors.redColor2,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Text('Edytuj profil'),
                    leadingAndTrailingTextStyle: TextStyles.addEventStyle2,
                    trailing: const Icon(Icons.navigate_next_outlined),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Text("Zmiana hasła"),
                    leadingAndTrailingTextStyle: TextStyles.addEventStyle2,
                    trailing: const Icon(Icons.navigate_next_outlined),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Text("Polityka prywatności"),
                    leadingAndTrailingTextStyle: TextStyles.addEventStyle2,
                    trailing: const Icon(Icons.navigate_next_outlined),
                  ),
                  const SizedBox(
                    height: 15,
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
