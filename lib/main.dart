import 'package:flutter/material.dart';
import 'src/views/signup/signup_screen.dart';
import 'src/views/home/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io' show Platform;

void main() {
  runApp(Trackr());
}

class Trackr extends StatelessWidget {
  // This widget is the root of your application.

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  //TODO: Make it a stateful widget
  @override
  void initState() {
    String host = Platform.isAndroid ? '10.0.2.2:8080' : 'localhost:8080';
    FirebaseFirestore.instance.settings = Settings(
      host: host,
      sslEnabled: false,
      persistenceEnabled: false,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
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

        // Otherwise, show something whilst waiting for initialization to complete
        return Text('Loading');
      },
    );
  }

  Future<void> _showMyDialog(BuildContext context, String msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Loading Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(msg),
                //Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
