import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  final calculator = StringCalculator();

  test('Returns 0 for an empty string', () {
    expect(calculator.add(""), 0);
  });

  test('Returns the number itself for a single number', () {
    expect(calculator.add('2'), 2);
  });

}
