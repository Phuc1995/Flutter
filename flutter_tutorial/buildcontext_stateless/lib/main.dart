import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(Stack1());





class Stack1 extends StatefulWidget {
  @override
  _StackState createState() => _StackState();
}

class _StackState extends State<Stack1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(width: 400, height: 400, color: Colors.green),
              Container(width: 300, height: 300, color: Colors.amber,),
              Container(width: 200, height: 200, color: Colors.red,)

            ],
          ),
        ),
      ),
    );
  }
}



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            alignment: AlignmentDirectional.center,
            transform: new Matrix4.rotationZ(30 * pi / 100),
//            padding: EdgeInsets.fromLTRB(0, 0, 0, 50.0),
            decoration: BoxDecoration(
              color: Colors.blue,
//              borderRadius: BorderRadius.all(Radius.circular(10)),
              shape: BoxShape.circle,
              border: Border.all(
                  width: 2.0, color: Colors.amber, style: BorderStyle.solid),
            ),
            width: 200.0,
            height: 200.0,
            child: Text(
              "contact",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
