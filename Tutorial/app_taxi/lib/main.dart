import 'package:app_taxi/src/app.dart';
import 'package:app_taxi/src/resources/login_page.dart';
import 'package:app_taxi/src/resources/widgets/ttc.dart';
import 'package:flutter/material.dart';
import 'package:app_taxi/src/blocs/auth_bloc.dart';

void main() => runApp(MyApp(new AuthBloc(),MaterialApp(
  home: LoginPage(),
)));


//void main() => runApp(App());