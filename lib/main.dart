import 'package:flutter/material.dart';
import 'package:register_login/screen/home.dart';
import 'package:register_login/screen/login.dart';
import 'package:register_login/screen/register.dart';
import 'package:register_login/screen/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/welcome': (context) => WelcomeScreen(),
      },
      title: 'Register&Login',
    );
  }
}
