import 'package:test/test.dart';
import 'remove_the_last_vowel.dart';

void main() {
  group("Test for Remove Last Vowel", () {
    test("Test funtion removeLastVowel", () {
      String input = "Those who dare to fail miserably can achieve greatly.";
      String actual = removeLastVowel(input);
      expect(actual, "Thos wh dar t fal miserbly cn achiev gretly.");
    });

  });
}
