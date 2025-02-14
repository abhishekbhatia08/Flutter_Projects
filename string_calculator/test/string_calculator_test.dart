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

  test('Handles custom delimiter', () {
    expect(calculator.add('//:\n4:3'), equals(7));
  });

  test('Ignores the number greater than 100', () {
    expect(calculator.add('1,1002,1000'), equals(1001));
  });

  test('Handles delimiter of any length', () {
    expect(calculator.add('//[%]\n4%9'), equals(13));
  });

  test('Throws exception for negative numbers', () {
    expect(() => calculator.add('1,-2,3,-4'), throwsA(isA<Exception>()));
  });
}
