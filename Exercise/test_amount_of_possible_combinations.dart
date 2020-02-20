import 'package:test/test.dart';
import 'amount_of_possible_combinations.dart';

void main(){
    group("Test for amount_of_possible_combinations", (){
      test("Test funtion combinations", (){
          int numberCard = 52;
          int actual = combinations(10,numberCard);
          expect(actual, 15820024220);
      });
    });
}
