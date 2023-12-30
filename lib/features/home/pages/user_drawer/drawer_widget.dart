import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/features/home/pages/user_drawer/widgets/drawer_tile.dart';
import 'package:primary_school/features/home/pages/user_drawer/widgets/sign_out_buttod.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      width: 250,
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(
              Icons.person,
              size: 110,
              color: AppColors.greenColor,
            ),
          ),
          DrawerTile(
            title: 'Strona główna',
            leadnig: const Icon(Icons.home),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          DrawerTile(
            title: 'Ustawienia',
            leadnig: const Icon(Icons.settings),
            onTap: () {},
          ),
          DrawerTile(
            title: 'Oceń nas',
            leadnig: const Icon(Icons.swap_vertical_circle_rounded),
            onTap: () {},
          ),
          const SizedBox(height: 200),
          const SignOutButton()
        ],
      ),
    );
  }
}
