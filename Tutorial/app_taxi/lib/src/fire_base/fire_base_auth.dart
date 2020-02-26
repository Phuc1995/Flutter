import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class FirAuth {
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  void signUp(String email, String pass, String name, String phone,
      Function onSuccess, Function(String) onRegisterError) {
    _fireBaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      _createUser(user.user.uid, name, phone, onSuccess, onRegisterError);
    }).catchError((err) {
      print("err: " + err.toString());
      _onSignUpErr(err.code, onRegisterError);
    });
  }

  void signIn(String email, String pass, Function onSuccess, Function(String) onSignInError){
    print("bbbbbbbbbbbb");
    _fireBaseAuth.signInWithEmailAndPassword(email: email, password: pass).then((user){
      print("sign in success");
      onSuccess();
    }

    ).catchError((err){
      print(err.code);
      onSignInError("Sign In fail, pleas try again");
    });
  }

  _createUser(String userId, String name, String phone, Function onSuccess,
      Function(String) onRegisterError) {
    var ref = FirebaseDatabase.instance.reference().child("users");
    var user = {"name": name, "phone": phone};

    ref.child(userId).set(user).then((user) {
      //success
      onSuccess();
    }).catchError((err) {
      onRegisterError("Dang ky that bai, vui long thu lai");
    });
  }

  void _onSignUpErr(String code, Function(String) onRegisterError) {
    debugPrint("aaaaaaaaaaaaaaaaaa: "+ code.toString());
    switch (code.toString()) {
      case "ERROR_INVALID_EMAIL":
      case "ERROR_INVALID_CREDENTIAL":
        onRegisterError("Invalid email");
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        onRegisterError("Email has existed");
        break;
      case "ERROR_WEAK_PASSWORD":
        onRegisterError("The password is not strong enough");
        break;
      default:
        onRegisterError("SignUp fail, please try again");
        break;
    }
  }
}
