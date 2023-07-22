import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/core/enums.dart';
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
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'Kalendarz',
          style: TextStyle(
            letterSpacing: 2,
            color: AppColors.accentColor,
          ),
        ),
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
            final eventModels = state.calendarItems;
            switch (state.status) {
              case Status.initial:
                return const Center(
                  child: Text('Initial state'),
                );
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case Status.success:
                return ListView(
                  children: [
                    const CalendarWidget(),
                    Column(
                      children: [
                        for (final eventModel in eventModels) ...[
                          Dismissible(
                            key: ValueKey(eventModel.id),
                            background: const DecoratedBox(
                              decoration:
                                  BoxDecoration(color: AppColors.redColor),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            confirmDismiss: (direction) async {
                              return direction == DismissDirection.endToStart;
                            },
                            onDismissed: (direction) {
                              context
                                  .read<CalendarCubit>()
                                  .remove(documentID: eventModel.id);
                            },
                            child: EventWidget(
                              eventModel: eventModel,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ],
                    )
                  ],
                );
              case Status.error:
                return Center(
                  child: Text(
                    state.errorMessage ?? 'Unknown error',
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                );
            }
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
