import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/features/home/home_page/cubit/home_page_cubit.dart';
import 'package:primary_school/features/home/home_page/widgets/get_appbar_widget.dart';
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
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: HomePageWidgets().getAppBar(context, state.currentIndex),
            body: _getBody(context, state.currentIndex),
            bottomNavigationBar:
                HomePageWidgets().bottomNavigatorBar(context, state),
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
        return HomePageWidgets().buildErrorView(context);
    }
  }
}
