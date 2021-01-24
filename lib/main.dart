import 'package:flutter/material.dart';
import './src/signup_screen.dart';
import './src/welcome_screen.dart';

void main() {
  runApp(Trackr());
}

class Trackr extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      title: "Trackr",
      routes: {
        '/': (context) => SignUpScreen(),
        '/welcome': (context) => WelcomeScreen(),
      },
    );
  }
}
