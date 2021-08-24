import 'package:flutter/material.dart';
import 'package:register_login/screen/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Register&Login', home: HomeScreen());
  }
}
