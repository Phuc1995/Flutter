import 'package:app_taxi/src/blocs/auth_bloc.dart';
import 'package:app_taxi/src/resources/login_page.dart';
import 'package:flutter/material.dart';

class MyApp extends InheritedWidget {
  final AuthBloc authBloc;
  final Widget child;
  MyApp(this.authBloc, this.child) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static MyApp of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MyApp);
  }
}

