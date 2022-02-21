import 'dart:convert';
import 'package:email_auth/email_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tugasakhir/helper/session_manager.dart';
import 'package:tugasakhir/model/Pagehome.dart';
import 'package:tugasakhir/auth/register.dart';
import '../helper/constant.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  bool _isHidePassword = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future loginUser() async {
    try {
      setState(() {
        isLoading = true;
      });

      var resJson = await http.post(Uri.parse(BASE_URL + "loginUser"),
          body: {'email': email.text, 'password': password.text});
      var data = jsonDecode(resJson.body);

      print(data);
      if (data['status'] == 200) {
        setState(() {
          isLoading = false;

          int Status = data['status'];
          String Email = email.text;
          String id = data['user']['id_user'];
          sessionManager.savePreferences(Status, Email, id);

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => Pagehome()));
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${data['message']}'),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${e.toString()}'),
      ));
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    _iconLogin(),
                    _titleDescription(),
                    _textField(),
                    _buildButton(context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconLogin() {
    return Image.asset(
      "assets/images/sapi.jpeg",
      height: 200.0,
    );
  }

  Widget _titleDescription() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 15.0),
        ),
        Text(
          "Masuk ke Aplikasi",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0),
        ),
      ],
    );
  }

  Widget _textField() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          validator: (value) {
            if (value.isEmpty) {
              return 'Tidak boleh kosong';
            }
            return null;
          },
          controller: email,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'masukan email',
            // suffixIcon: Icon(Icons.keyboard),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          validator: (value) {
            if (value.isEmpty) {
              return 'Tidak boleh kosong';
            }
            return null;
          },
          controller: password,
          obscureText: _isHidePassword,
          autofocus: false,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'masukan sandi',
            // prefixIcon: Icon(Icons.vpn_key),
            suffixIcon: GestureDetector(
              onTap: () {
                _togglePasswordVisibility();
              },
              child: Icon(
                _isHidePassword ? Icons.visibility_off : Icons.visibility,
                color: _isHidePassword ? Colors.grey : Colors.blue,
              ),
            ),
            isDense: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 25.0),
        ),
        isLoading && false
            ? Center(
                child: CircularProgressIndicator(),
              )
            : MaterialButton(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 13),
                  width: double.maxFinite,
                  child: Text(
                    'Masuk',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () async {
                  if (formKey.currentState.validate()) {
                    await loginUser();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tidak boleh kosong')));
                  }
                },
              ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          'atau',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        FlatButton(
          child: Text(
            'Daftar',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => register()));
          },
        ),
      ],
    );
  }
}
