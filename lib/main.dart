import 'package:flutter/material.dart';
import 'package:tugasakhir/model/Pagehome.dart';
import 'package:tugasakhir/auth/login.dart';
import 'package:tugasakhir/menu/profile.dart';
import 'package:tugasakhir/model/splashscreen.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'SplashScreen',
    home: splashscreen(),
  ));
}
