import 'package:flutter/material.dart';
import 'package:primary_school/app/features/home/pages/calendar_page/calendar_page.dart';
import 'package:primary_school/app/features/home/pages/notes_page/notes_page.dart';
import 'package:primary_school/app/features/home/pages/user_page/user_page.dart';
import 'package:primary_school/app/features/home/pages/weather_page/weather_page.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/constans/font_style.dart';

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
      body: Builder(
        builder: (context) {
          if (currentIndex == 0) {
            return const CalendarPage();
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
        unselectedLabelStyle: TextStyles.addEventStyle1,
        selectedLabelStyle: TextStyles.addEventStyle1,
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: AppColors.primaryColor,
            icon: Icon(
              Icons.calendar_month_outlined,
            ),
            label: 'Plany',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.primaryColor,
            icon: Icon(
              Icons.text_snippet_outlined,
            ),
            label: 'Notatki',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.primaryColor,
            icon: Icon(Icons.wb_cloudy_outlined),
            label: 'Pogoda',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.primaryColor,
            icon: Icon(Icons.account_box_outlined),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
