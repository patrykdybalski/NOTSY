import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/app/core/config.dart';

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
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 32),
          const Image(image: AssetImage('assets/images/logo@1.png')),
          const SizedBox(height: 32),
          const SignOutButton(),
          const SizedBox(height: 64),
          ListTile(
            onTap: () {},
            leading: const Text('Ukończone zadania'),
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
          const SizedBox(height: 64),
          Text(Config.configMessage),
        ]),
      ),
    );
  }
}
