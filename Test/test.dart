void main() {
  print(oddishOrEvenish(43));
  print(oddishOrEvenish(373));
  print(oddishOrEvenish(4433));
}

String oddishOrEvenish(int num) {
  var result = "";
  var total = 0;
  var convert = num.toString().split('');
  for (var i in convert) {
    total += int.parse(i);
  }
  if (total.isOdd) {
    return "Oddish";
  } else {
    return "Evenish";
  }
}
