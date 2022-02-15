import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tugasakhir/auth/login.dart';
import 'package:tugasakhir/helper/session_manager.dart';
import 'package:tugasakhir/model/Pagehome.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState(){
    super.initState();
    startSplashScreen();
  }

  void startSplashScreen() async {
    Future.delayed(Duration(seconds: 3), () {
      sessionManager.getPreferences().then((value) {
        if (value == 200) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => Pagehome()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => login()));
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/images/hello.gif",
          width: 300,
          height: 200,
        ),
      ),
    );
  }
}
