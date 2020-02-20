class TooOldForServiceException implements Exception {
Cadet _cadet;
TooOldForServiceException(this._cadet);
toString(){
return "${_cadet.name} is too old to be in military service.";
}
}
class Cadet {
String _name;
int _age;
Cadet(this._name, this._age);
get age{
return _age;
}
get name{return _name;
}
}

void main() {
print('start');
List<Cadet> cadetList = [
Cadet("Tom", 21),
Cadet("Dick", 37),
Cadet("Harry", 51),
Cadet("Mark", 52),
];
List<Cadet> validCadetList = [];
for (Cadet cadet in cadetList){
try {
validateCadet(cadet);
validCadetList.add(cadet);
} on TooOldForServiceException catch(ex) {
print(ex);} // .. other validation exceptions ...  
}
print('finish: ${validCadetList.length} of ${cadetList.length} cadets are valid.');
}
void validateCadet(Cadet cadet){
if (cadet.age > 50){
throw new TooOldForServiceException(cadet);
}
// .. other validations ...
}