import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
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
}
