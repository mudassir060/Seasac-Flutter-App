// ignore_for_file: annotate_overrides, file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seasac/login.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 400,
            height: 400,
            child: Image.asset('images/Logo.png'),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
              child: const LinearProgressIndicator(
                minHeight: 20,
                backgroundColor: Colors.black12,
            color: Colors.black54,
          )),
        ],
      ),
    ));
  }
}
