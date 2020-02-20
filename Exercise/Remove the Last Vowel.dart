void main() {
  print(removeLastVowel('Those who dare to fail miserably can achieve greatly.'));
  print(removeLastVowel('Love is a serious mental disease.'));
  print(removeLastVowel('Get busy living or get busy dying.'));
}

String removeLastVowel(s) {
  var list_dafault = ['a', 'o', 'e', 'u', 'i'];
  var result = "";
  var list = [];
  list = s.split(" ");
  for (var index in list) {
    var list2 = index.split("");
    var length = list2.length;
    for (var i = length - 1; i >= 0; i--) {
      if (list_dafault.contains(list2[i])) {
        list2[i] = "";
        break;
      }
    }
    result = result + " " + list2.join();
  }
  return result;

}
