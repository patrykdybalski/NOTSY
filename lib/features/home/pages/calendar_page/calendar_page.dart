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
            color: AppColors.accentColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          color: AppColors.accentColor,
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline_outlined,
              size: 35,
              color: AppColors.accentColor,
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
                const CalendarWidget(
                 
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              offset: Offset(0, 0),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Material(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              // Logika po naciśnięciu przycisku
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
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
