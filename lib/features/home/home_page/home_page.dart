import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/features/home/home_page/cubit/home_page_cubit.dart';
import 'package:primary_school/features/home/pages/user_drawer/drawer_widget.dart';
import 'package:primary_school/features/home/pages/event_page/event_page/event_page.dart';
import 'package:primary_school/features/home/pages/notes_page/notes_page.dart';
import 'package:primary_school/features/home/pages/weather_page/weather_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomePageCubit>(),
      child: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          return Scaffold(
            drawer: const DrawerWidget(),
            backgroundColor: AppColors.primaryColor,
            appBar: _getAppBar(context, state.currentIndex),
            body: _getBody(context, state.currentIndex),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              elevation: 15,
              backgroundColor: AppColors.primaryColor,
              selectedItemColor: AppColors.greenColor,
              unselectedItemColor: AppColors.secondaryColor,
              unselectedLabelStyle: TextStyles.textStyle2(14),
              selectedLabelStyle: TextStyles.textStyle2(14),
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

      default:
        return _buildErrorView(context);
    }
  }

  PreferredSizeWidget _getAppBar(BuildContext context, int currentIndex) {
    PreferredSizeWidget appBar({required String text1, required String text2}) {
      return AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/logo@0_5.png'),
              height: 40,
              width: 40,
            ),
            Text(
              text1,
              style: TextStyles.textStyle1(28),
            ),
            Text(
              text2,
              style: TextStyles.textStyle2(28),
            ),
          ],
        ),
        shadowColor: AppColors.secondaryColor,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.blueAccent,
                AppColors.greenColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: GradientRotation(240),
            ),
          ),
        ),
      );
    }

    switch (currentIndex) {
      case 0:
        return appBar(text1: 'Hook', text2: 'Planner');
      case 1:
        return appBar(text1: 'Hook', text2: 'Notes');
      case 2:
        return appBar(text1: 'Hook', text2: 'Pogoda');

      default:
        return AppBar();
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
