import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/constans/colors.dart';

import 'package:primary_school/domain/repositories/events_repository.dart';
import 'package:primary_school/features/home/pages/add_event_dialog/add_event_dialog.dart';
import 'package:primary_school/features/home/pages/calendar_page/cubit/calendar_cubit.dart';
import 'package:primary_school/features/home/pages/calendar_page/widgets/calendar_widget.dart';
import 'package:primary_school/features/home/pages/calendar_page/widgets/event_widget.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({
    super.key,
  });

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text(
          'Kalendarz',
          style: TextStyle(
            letterSpacing: 2,
            color: Colors.white70,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          color: Colors.white70,
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline_outlined,
              size: 35,
              color: AppColors.secondaryColor,
            ),
            padding: const EdgeInsets.only(right: 5),
            onPressed: () {
              _showDialog();
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => CalendarCubit(
          EventsRepository(),
        )..start(),
        child: BlocBuilder<CalendarCubit, CalendarState>(
          builder: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              return Center(
                child: Text(
                  'Coś  poszło nie tak: ${state.errorMessage}',
                ),
              );
            }
            if (state.isLoading) {
              return const CircularProgressIndicator();
            }
            final eventModels = state.calendarItems;

            return ListView(
              children: [
                const CalendarWidget(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: TextButton(
                    onPressed: () {
                      _showDialog();
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: const Color(0xff7fab72),
                        side: const BorderSide(
                          color: Colors.yellow,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        )),
                    child: const Text(
                      'Dodaj wydarzenie',
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    for (final eventModel in eventModels) ...[
                      EventWidget(
                        eventModel: eventModel,
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return const AddEventDialog();
        });
  }
}
