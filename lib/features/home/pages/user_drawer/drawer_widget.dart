import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/features/home/pages/user_drawer/widgets/drawer_tile.dart';
import 'package:primary_school/features/home/pages/user_drawer/widgets/settings.dart';
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
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/Logo@0_75.png'),
                  width: 70,
                ),
                Text(
                  'NOTSY',
                  style: TextStyles.appBarStyle1(
                      34, Theme.of(context).colorScheme.inversePrimary),
                ),
              ],
            ),
          ),
          DrawerTile(
            title: 'Strona główna',
            leadnig: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          DrawerTile(
            title: 'Ustawienia',
            leadnig: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const MySettings()),
                ),
              );
            },
          ),
          DrawerTile(
            title: 'Oceń nas',
            leadnig: Icon(
              Icons.swap_vertical_circle_rounded,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            onTap: () {},
          ),
          const SizedBox(height: 200),
          const SignOutButton()
        ],
      ),
    );
  }
}
