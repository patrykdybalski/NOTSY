import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/features/home/pages/add_event_dialog/add_event_dialog.dart';
import 'package:primary_school/features/home/pages/calendar_page/cubit/calendar_cubit.dart';
import 'package:primary_school/features/home/pages/calendar_page/widgets/calendar_widget.dart';
import 'package:primary_school/features/home/pages/calendar_page/widgets/event_widget.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0c1020),
      appBar: AppBar(
        title: const Text(
          'Kalendarz',
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff0c1020),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline_outlined,
              size: 35,
              color: Color(0xff01D68E),
            ),
            padding: const EdgeInsets.only(right: 5),
            onPressed: () {
              _showDialog();
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => CalendarCubit()..start(),
        child: BlocBuilder<CalendarCubit, CalendarState>(
          builder: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              return Center(
                child: Text(
                  'Coś poszło nie tak: ${state.errorMessage}',
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
