import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/domain/repositories/event/event_repository.dart';
import 'package:primary_school/features/home/pages/event_page/event_page/cubit/event_cubit.dart';

class MockEventRepository extends Mock implements EventRepository {}

void main() {
  late EventCubit sut;
  late MockEventRepository repository;

  setUp(() {
    repository = MockEventRepository();
    sut = EventCubit(repository);
  });

  group('start()', () {
    group('succes', () {
      setUp(() {
        when(() => repository.getEventsStream())
            .thenAnswer((_) => Stream.value([
                  EventModel(
                    title: 'title',
                    subtitle: 'subtitle',
                    selectedDay: DateTime(DateTime.now().year, 6, 23),
                    selectedTime: DateTime(DateTime.now().year, 6, 23),
                    id: 'id',
                  )
                ]));
      });

      blocTest<EventCubit, EventState>(
          'emits Status.loading then Status.success with EventModel',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: (() => {
                EventState(status: Status.loading),
                EventState(
                  status: Status.success,
                  calendarItems: [
                    EventModel(
                      title: 'title',
                      subtitle: 'subtitle',
                      selectedDay: DateTime(DateTime.now().year, 6, 23),
                      selectedTime: DateTime(DateTime.now().year, 6, 23),
                      id: 'id',
                    )
                  ],
                )
              }));
    });
    group('failure', () {
      setUp(() {
        when(() => repository.getEventsStream())
            .thenAnswer((_) => Stream.error(Exception('error')));
      });

      blocTest<EventCubit, EventState>(
        'emits Status.loading then Status.error with errorMessage',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
          EventState(status: Status.loading),
          EventState(
            status: Status.error,
            errorMessage: 'Exception: error',
          ),
        ],
      );
    });
  });
}
