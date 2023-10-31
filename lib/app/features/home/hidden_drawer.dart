import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:primary_school/app/features/home/pages/user_page/user_page.dart';
import 'package:primary_school/constans/colors.dart';


class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer(c, {super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

List<ScreenHiddenDrawer> _pages = [
  ScreenHiddenDrawer(
    ItemHiddenMenu(
      name: 'Profil',
      baseStyle: const TextStyle(fontSize: 15),
      selectedStyle: const TextStyle(fontSize: 15),
    ),
    const UserPage(),
  ),
  ScreenHiddenDrawer(
    ItemHiddenMenu(
        name: 'Wyloguj się',
        baseStyle: const TextStyle(fontSize: 15),
        selectedStyle: const TextStyle(fontSize: 15),
        onTap: () {}),
    const UserPage(),
  ),
];

class _HiddenDrawerState extends State<HiddenDrawer> {
  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: AppColors.primaryColor,
      screens: _pages,
      initPositionSelected: 0,
    );
  }
}
