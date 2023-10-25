import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/app/features/home/pages/calendar_page/add_event_dialog/add_event_dialog.dart';
import 'package:primary_school/app/features/home/pages/calendar_page/cubit/event_cubit.dart';
import 'package:primary_school/app/features/home/pages/calendar_page/edit_event_screen/edit_event_screen.dart';
import 'package:primary_school/app/features/home/pages/calendar_page/widgets/event_widget.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/constans/font_style.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/domain/repositories/event/events_repository.dart';

class EventPage extends StatefulWidget {
  const EventPage({
    super.key,
  });

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'Zaplanowane',
        ),
        titleTextStyle: TextStyles.headingStyle,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.greenColor,
        onPressed: () {
          _showDialog();
        },
        child: const Icon(
          Icons.add,
          size: 25,
        ),
      ),
      body: BlocProvider(
        create: (context) => EventCubit(
          EventsRepository(),
        )..start(),
        child: BlocBuilder<EventCubit, EventState>(
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
                    // const CalendarWidget(),

                    const SizedBox(
                      height: 15,
                    ),

                    Column(
                      children: [
                        for (final eventModel in eventModels) ...[
                          SlidableEventWidget(eventModel: eventModel),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ],
                    ),
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
        useSafeArea: true,
        context: context,
        builder: (context) {
          return const AddEventDialog();
        });
  }
}

class SlidableEventWidget extends StatelessWidget {
  const SlidableEventWidget({
    super.key,
    required this.eventModel,
  });

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(eventModel.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              showDialog(
                context: context,
                builder: ((context) {
                  return AlertDialog(
                    title: const Text('Oznaczyć jako ukończone?'),
                    titleTextStyle: TextStyles.deleteDialogTextStyle1,
                    elevation: 20,
                    backgroundColor: AppColors.primaryColor,
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Nie',
                          style: TextStyles.deleteDialogTextStyle2,
                        ),
                      ),
                      BlocProvider(
                        create: (context) => EventCubit(EventsRepository()),
                        child: BlocBuilder<EventCubit, EventState>(
                          builder: (context, state) {
                            return TextButton(
                              onPressed: () {
                                context.read<EventCubit>().remove(
                                      documentID: eventModel.id,
                                    );
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Tak',
                                style: TextStyles.deleteDialogTextStyle2,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }),
              );
            },
            padding: const EdgeInsets.all(0),
            label: 'Ukończone',
            icon: Icons.task_alt_outlined,
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.greenColor,
            spacing: 5,
          ),
          SlidableAction(
            onPressed: (context) {
              _showEditDialog(context);
            },
            label: 'Edytuj',
            icon: Icons.mode_edit_outline_outlined,
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.secondaryColor,
            spacing: 5,
          ),
        ],
      ),
      child: EventWidget(
        eventModel: eventModel,
      ),
    );
  }

  _showEditDialog(context) {
    showDialog(
        useSafeArea: true,
        context: context,
        builder: (context) {
          return EditEventScreen(
            eventModel: eventModel,
          );
        });
  }
}
