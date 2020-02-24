import 'dart:async';
import 'package:form_login/src/validators/validations.dart';

class LoginBloc {
  StreamController _userController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;

  bool isValiLogin(String user, String pass) {
    if (!Validation.isValidUser(user)) {
      //sink is input
      _userController.sink.addError("User error");
      //
      return false;
    }
    _userController.add("OK");

    if (!Validation.isValidPass(pass)) {
      _passController.sink.addError("Password error");
      return false;
    }
    _passController.add("OK");

    return true;
  }

  void dispose() {
    _userController.close();
    _passController.close();
  }
}
