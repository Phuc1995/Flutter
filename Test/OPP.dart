main(){
  var dog = new Dog(5, color: "Red");
  dog.legs = 10;
  print(dog.legs);
  dog.fly();
  dog.abtraction();
  dog.math(1);

}
/**
 * 1. Contructor: Default constructor, parameter constructor, Named constructor
 * 2. Factory
 * 3. Getter-Setter
 * 4. Extends
 * 5. Abstraction
 * 6. Interface
 * 7. with - da ke thua
 * 8. Optional
 */

abstract class Interface{
  void interface1();
  void interface2();
}

class testInterface implements Interface{
  @override
  void interface1() {
    // TODO: implement interface1
  }

  @override
  void interface2() {
    // TODO: implement interface2
  }

}

abstract class Animal{
  int _legs;

  void abtraction();

  void fly(){
   
    print("fly");
  }
}

class Dog extends Animal{
  
  set legs(value) => _legs = value;
  int get legs => _legs;
  String color;

  void math(int a, [int b, int c]){
    print("${a}-${c}-${b}");
  }
/** 
  set legs(value){
    _legs = value;
  }

  int get legs{
    return _legs;
  }
*/

/** 
  factory Dog(int type){
    if(type == 0){
      return Dog.male();
    } 
    return Dog.Female();
    }
*/

  //Default constructor
  Dog(int legs, {this.color}){
    print("default contructor");
    }

/*
  // parameter constructor
  Dog(int legs){
    print("parameter contructor");
    this.legs = legs;
    }
*/
  Dog.male(){
    print("Male Dog");
  }

  
  Dog.Female(){
    print("Female Dog");
  }

  void talk(){
    print("Gau Gau");
    }

  @override
  void abtraction() {
    print("Abtraction");
  }
}