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

  test('Returns sum of two numbers', () {
    expect(calculator.add('2,8'), equals(10));
  });

  test('Handles multiple numbers', () {
    expect(calculator.add('1,2,3,4'), equals(10));
  });

  test('Handles new line as a delimiter', () {
    expect(calculator.add('1\n2,3'), equals(6));
  });

}
