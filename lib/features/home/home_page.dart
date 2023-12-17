import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/features/home/cubit/home_page_cubit.dart';
import 'package:primary_school/features/home/pages/event_page/event_page/event_page.dart';
import 'package:primary_school/features/home/pages/notes_page/notes_page.dart';
import 'package:primary_school/features/home/pages/user_page/user_page.dart';
import 'package:primary_school/features/home/pages/weather_page/weather_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit(),
      child: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: _getBody(context, state.currentIndex),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              elevation: 10,
              backgroundColor: AppColors.primaryColor,
              selectedItemColor: AppColors.redColor,
              unselectedItemColor: AppColors.secondaryColor,
              unselectedLabelStyle: TextStyles.textStyle2(13),
              selectedLabelStyle: TextStyles.textStyle2(13),
              currentIndex: state.currentIndex,
              onTap: (index) =>
                  context.read<HomePageCubit>().changeIndex(index),
              items: const [
                BottomNavigationBarItem(
                  label: 'Plany',
                  backgroundColor: AppColors.primaryColor,
                  icon: Icon(Icons.calendar_month_outlined),
                ),
                BottomNavigationBarItem(
                  label: 'Notatki',
                  backgroundColor: AppColors.primaryColor,
                  icon: Icon(Icons.text_snippet_outlined),
                ),
                BottomNavigationBarItem(
                  label: 'Pogoda',
                  backgroundColor: AppColors.primaryColor,
                  icon: Icon(Icons.wb_cloudy_outlined),
                ),
                BottomNavigationBarItem(
                    label: 'Profil',
                    backgroundColor: AppColors.primaryColor,
                    icon: Icon(Icons.account_box_outlined)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _getBody(BuildContext context, int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const EventPage();
      case 1:
        return const NotesPage();
      case 2:
        return const WeatherPage();
      case 3:
        return const UserPage();
      default:
        return _buildErrorView(context);
    }
  }

  Widget _buildErrorView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Coś poszło nie tak!',
            style: TextStyle(color: Colors.red),
          ),
          TextButton(
            onPressed: () {
              context.read<HomePageCubit>().changeIndex(0);
            },
            child: const Text('Powrót'),
          ),
        ],
      ),
    );
  }
}
