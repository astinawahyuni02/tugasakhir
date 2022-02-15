import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tugasakhir/helper/session_manager.dart';
import '../helper/constant.dart';
import 'login.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController email = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  bool _isHidePassword = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> registerUser() async {
    try {
      setState(() {
        isLoading = true;
      });

      var url = Uri.parse(BASE_URL + "registerUser");
      var resJson = await http.post(url, body: {
        'email': email.text,
        'fullname': fullname.text,
        'password': password.text
      });
      print("Res ${resJson.body}");

      var data = jsonDecode(resJson.body);
      if (data['status'] == 200) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data['message']}')));
        });
        Navigator.push(context, MaterialPageRoute(builder: (_) => login()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${data['message']}')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${e.toString()}')));
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
          "Daftar Aplikasi",
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
          },controller: email,
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
          controller: fullname,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'masukan nama lengkap',
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
                    'Register',
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
                    await registerUser();
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
          'or',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ),
        ),
        FlatButton(
          child: Text(
            'Login',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => login()));
          },
        ),
      ],
    );
  }
}
