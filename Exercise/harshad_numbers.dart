void main() {
  // print(harshad(5));
  print(harshad(133));
  // print(harshad(82));
  // print(harshad(72));
  // print(harshad(12751223));
  // print(harshad(5831));
  // print(harshad(10309));
  // print(harshad(7384));
  // print(harshad(2584));
}

List<int> harshad(n) {
  if (n <= 0) {
    return [0, 0];
  } else {
    List<int> listAfter = getListResult(n, true);
    List<int> listBefore = getListResult(n, false);
    if (listBefore.length != 0) {
      listBefore.removeAt(0);
    }
    List<int> result = listAfter + listBefore;
    result.sort();
    return [result.length, result.indexOf(n) + 1];
  }
}

List<int> getListResult(int n, bool index) {
  //note
  List<int> list = [];
  var total = countTotal(n);
  bool check = true;
  while (check) {
    if (n == 0) {
      check = false;
    } else if (n % total == 0) {
      list.add(n);
      if (index) {
        n = n + 1;
      } else {
        n = n - 1;
      }
      if (n == 0) {
        break;
      }
      total = countTotal(n);
    } else {
      check = false;
    }
  }
  return list;
}

int countTotal(n) {
  var total = 0;
  var convert = n.toString().split('');
  for (var i in convert) {
    total += int.parse(i);
  }
  return total;
}
