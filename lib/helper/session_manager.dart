import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugasakhir/auth/login.dart';

class SessionManager {
  String email, id_user;
  int  status;

  Future<void> savePreferences(int myStatus, String myEmail, String myId_user ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('status', myStatus);
    await prefs.setString('email', myEmail);
    await prefs.setString('id_user', myId_user);
    // await prefs.setString('id_level', idLevel);
    // await prefs.setString('is_active', is_active);
    // await prefs.setString('fullname', myFullname);
  }

  Future<int> getPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    status = prefs.getInt('status');
    // fullname = prefs.getString('fullname');
    email = prefs.getString('email');
    id_user = prefs.getString('id_user');
    // is_active = prefs.getString('is_active');
    return status;
  }

  Future <String> getIdUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id_user = prefs.getString('id_user');
    return id_user;
  }

  void clearSession(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int initScreen = prefs.getInt('initPopup');
    prefs.clear();
    if (initScreen != null) {
      await prefs.setInt('initPopup', 1);
    }
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => login()), (route) => false);
  }
}

//untuk agar kita bisa akses disemua kelas
final sessionManager = SessionManager();
