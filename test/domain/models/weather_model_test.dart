import 'package:flutter_test/flutter_test.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';

void main() {
  test('should getter nameWithCountry return name and country combined', () {
    final model = Location('Warszawa', 'Poland');

    final result = model.nameWithCountry;

    expect(result, 'Warszawa, Poland');
  });
}
