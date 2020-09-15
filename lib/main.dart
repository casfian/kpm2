import 'package:flutter/material.dart';
import 'package:kpm2/screens/fail.dart';
import 'package:kpm2/screens/login.dart';
import 'package:kpm2/screens/register.dart';
import 'package:kpm2/screens/screen1.dart';
import 'package:kpm2/screens/screen2.dart';
import 'package:kpm2/screens/screen3.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Login(),
      routes: <String, WidgetBuilder> {
        'login': (BuildContext context) => Login(),
        'fail': (BuildContext context) => Fail(),
        'register': (BuildContext context) => Register(),
        'screen1': (BuildContext context) => Screen1(),
        'screen2': (BuildContext context) => Screen2(),
        'screen3': (BuildContext context) => Screen3(),
      }
    );
  }
}