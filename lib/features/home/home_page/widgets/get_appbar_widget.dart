import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/features/home/home_page/cubit/home_page_cubit.dart';

import 'package:provider/provider.dart';

class HomePageWidgets {
  PreferredSizeWidget getAppBar(BuildContext context, int currentIndex) {
    PreferredSizeWidget appBar({required String text2}) {
      return AppBar(
        title: Text(
          text2,
          style: TextStyles.appBarStyle1(
            28,
            Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        shadowColor: Theme.of(context).colorScheme.secondary,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 2,
      );
    }

    switch (currentIndex) {
      case 0:
        return appBar(text2: 'Plan');
      case 1:
        return appBar(text2: 'Notatka');
      case 2:
        return appBar(text2: 'Pogoda');

      default:
        return AppBar();
    }
  }

  BottomNavigationBar bottomNavigatorBar(
      BuildContext context, HomePageState state) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      elevation: 15,
      backgroundColor: Theme.of(context).colorScheme.background,
      selectedItemColor: Theme.of(context).colorScheme.tertiary,
      unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
      unselectedLabelStyle: TextStyles.textStyle2(
        14,
        Theme.of(context).colorScheme.inversePrimary,
      ),
      selectedLabelStyle: TextStyles.textStyle2(
        14,
        Theme.of(context).colorScheme.inversePrimary,
      ),
      currentIndex: state.currentIndex,
      onTap: (index) => context.read<HomePageCubit>().changeIndex(index),
      items: const [
        BottomNavigationBarItem(
          label: 'Plany',
          icon: Icon(Icons.calendar_month_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Notatki',
          icon: Icon(Icons.text_snippet_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Pogoda',
          icon: Icon(Icons.wb_cloudy_outlined),
        ),
      ],
    );
  }

  Widget buildErrorView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Coś poszło nie tak!',
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          TextButton(
            onPressed: () {
              context.read<HomePageCubit>().changeIndex(0);
            },
            child: Text(
              'Powrót',
              style: TextStyles.textStyle1(
                14,
                Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
