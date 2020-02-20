import 'package:test/test.dart';
import 'oddish_vs_evenish.dart';

void main() {
  group("Test for oddish_vs_evenish", () {
    test("Test check number is old", () {
      int number = 43;
      String actual = oddishOrEvenish(number);
      expect(actual, "Oddish");
    });
    test("Test check number is Evenish", () {
      int number = 4433;
      String actual = oddishOrEvenish(number);
      expect(actual, "Evenish");
    });
  });
}
