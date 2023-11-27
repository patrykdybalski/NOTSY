import 'package:flutter_test/flutter_test.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';

void main() {
  test('should getter nameWithCountry return name and country combined', () {
    //1
    final model = Location('Warszawa', 'Poland');

    //2
    final result = model.nameWithCountry;

    //3
    expect(result, 'Warszawa, Poland');
  });
}
