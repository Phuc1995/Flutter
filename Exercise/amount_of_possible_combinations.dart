void main(){
  print(combinations(10,52));
}

int combinations(k, n) {
	var divisor = n-k;
	var fact1 = 1;
	var fact2 = 1;
	while(n != divisor){
		fact1 = fact1 * n;
		n--;
	}
	while(k != 0){
		fact2 = fact2 * k;
		k--;
	}
  var result = fact1~/fact2;
	return result;
}