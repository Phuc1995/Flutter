import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirAuth  {
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  void signUp(String email, String pass, String name, String phone, Function onSuccess) {
    _fireBaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
          _createUser(user.user.uid, name, phone, onSuccess);
    }).catchError((err) {
      print("err: " + err.toString());
    });
  }

  _createUser(String userId, String name, String phone, Function onSuccess){
    var ref = FirebaseDatabase.instance.reference().child("users");
    var user = {
      "name": name,
      "phone": phone
    };

    ref.child(userId).set(user).then((user) {
      //success
      onSuccess();
    }).catchError((err){

    });
  }
}