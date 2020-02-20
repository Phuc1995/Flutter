import 'package:test/test.dart';
import 'harshad_numbers.dart';

void main(){
    group("Test for harshad_numbers", (){
      test("Test funtion countTotal", (){
          int n = 133;
          int actual = countTotal(n);
          expect(actual, 7);
      });
      test("Test funtion getListResultAfter", (){
          int n = 133;
          bool check = true;
          var actual = getListResult(n,check);
          expect(actual, [133]);
      });
      test("Test funtion getListResultBefore", (){
          int n = 133;
          bool check = false;
          var actual = getListResult(n,check);
          expect(actual, [133,132]);
      });
      test("Test funtion harshad", (){
          int n = 133;
          var actual = harshad(n);
          expect(actual, [2,2]);
      });
    });
}
