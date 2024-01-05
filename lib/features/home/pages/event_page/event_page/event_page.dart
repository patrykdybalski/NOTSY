import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/features/home/pages/event_page/event_page/cubit/event_cubit.dart';
import 'package:primary_school/features/home/pages/event_page/event_page/widgets/slidable_event_widget.dart';
import 'package:primary_school/features/home/pages/event_page/screens/add_event_dialog/add_event_dialog.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        onPressed: () {
          _showDialog();
        },
        child: Icon(
          Icons.edit_calendar_outlined,
          size: 30,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<EventCubit>()..start(),
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

              case Status.error:
                return Center(
                  child: Text(
                    state.errorMessage ?? 'Unknown error',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                );
              case Status.success:
                return ListView(
                  children: [
                    const SizedBox(height: 24),
                    Column(
                      children: [
                        for (final eventModel in eventModels) ...[
                          SlidableEventWidget(eventModel: eventModel),
                          const SizedBox(height: 6),
                        ],
                      ],
                    ),
                    const SizedBox(height: 50),
                  ],
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
