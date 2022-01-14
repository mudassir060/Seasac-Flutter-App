import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:seasac/SplashScreen.dart';
import 'package:seasac/addCollection.dart';
import 'package:seasac/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pay Per Click',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          // Initialize FlutterFire
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              return const Text("Some thing Went Wrong");
            }

            // Once complete, show your application
            if (snapshot.connectionState == ConnectionState.done) {
              return SplashScreen();
            }

            // Otherwise, show something whilst waiting for initialization to complete
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}