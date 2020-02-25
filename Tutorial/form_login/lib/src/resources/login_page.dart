import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:form_login/src/blocs/login_bloc.dart';
import 'package:form_login/src/resources/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc loginBloc = new LoginBloc();

  bool _showPass = false;

  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              //padding at end of layout
              mainAxisAlignment: MainAxisAlignment.end,
              //at left of layout
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Container(
                      padding: EdgeInsets.all(15),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black26,
                      ),
                      child: FlutterLogo()),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                  child: Text(
                    "Hello \nWelcome you to come here",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: StreamBuilder<DynamicLibrary>(
                      stream: loginBloc.userStream,
                      builder: (context, snapshot) => TextField(
                        controller: _userController,
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                        decoration: InputDecoration(
                            labelText: "USER NAME",
                            errorText:
                                snapshot.hasError ? snapshot.error : null,
                            labelStyle: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 15,
                            )),
                      ),
                    )),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      StreamBuilder(
                        stream: loginBloc.passStream,
                        builder: (context, snapshot) => TextField(
                          controller: _passController,
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                          obscureText: !_showPass,
                          decoration: InputDecoration(
                              labelText: "PASSWORD",
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              labelStyle: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 15,
                              )),
                        ),
                      ),
                      GestureDetector(
                        onTap: onToggleShowPass,
                        child: Text(
                          _showPass ? "HIDE" : "SHOW",
                          style: TextStyle(
                              fontSize: 15.5,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                //Full screen
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      onPressed: onSignInClicked,
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "NEW USER? SIGN UP",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black26,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "FORGOT PASSWORD",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void onSignInClicked() {
    if (loginBloc.isValiLogin(_userController.text, _passController.text)) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

//  Widget gotoHome(BuildContext context){
//    return HomePage();
//  }
}
