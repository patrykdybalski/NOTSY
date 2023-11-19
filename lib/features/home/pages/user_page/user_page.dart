import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';

import 'widgets/sign_out_buttod.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text('Mój profil'),
        titleTextStyle: TextStyles.textStyleRed(24),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 8,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('images/last_check_logo1.png'),
              radius: 130,
            ),
            const SizedBox(
              height: 8,
            ),
            const SignOutButton(),
            const SizedBox(
              height: 40,
            ),
            ListTile(
              onTap: () {},
              leading: const Text('Edytuj profil'),
              leadingAndTrailingTextStyle: TextStyles.textStyle1(16),
              trailing: const Icon(Icons.navigate_next_outlined),
            ),
            ListTile(
              onTap: () {},
              leading: const Text("Zmiana hasła"),
              leadingAndTrailingTextStyle: TextStyles.textStyle1(16),
              trailing: const Icon(Icons.navigate_next_outlined),
            ),
            ListTile(
              onTap: () {},
              leading: const Text("Polityka prywatności"),
              leadingAndTrailingTextStyle: TextStyles.textStyle1(16),
              trailing: const Icon(Icons.navigate_next_outlined),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
