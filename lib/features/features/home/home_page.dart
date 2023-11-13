import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/features/features/home/pages/event_page/event_page.dart';
import 'package:primary_school/features/features/home/pages/notes_page/notes_page.dart';
import 'package:primary_school/features/features/home/pages/user_page/user_page.dart';
import 'package:primary_school/features/features/home/pages/weather_page/weather_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

var currentIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Builder(
        builder: (context) {
          if (currentIndex == 0) {
            return const EventPage();
          }
          if (currentIndex == 1) {
            return const NotesPage();
          }
          if (currentIndex == 2) {
            return const WeatherPage();
          }
          return const UserPage();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        elevation: 10,
        backgroundColor: AppColors.primaryColor,
        selectedItemColor: AppColors.redColor,
        unselectedItemColor: AppColors.secondaryColor,
        unselectedLabelStyle: TextStyles.textStyle2(13),
        selectedLabelStyle: TextStyles.textStyle2(13),
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Plany',
            backgroundColor: AppColors.primaryColor,
            icon: Icon(
              Icons.calendar_month_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Notatki',
            backgroundColor: AppColors.primaryColor,
            icon: Icon(
              Icons.text_snippet_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Pogoda',
            backgroundColor: AppColors.primaryColor,
            icon: Icon(Icons.wb_cloudy_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Profil',
            backgroundColor: AppColors.primaryColor,
            icon: Icon(Icons.account_box_outlined),
          ),
        ],
      ),
    );
  }
}
