import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';

/// Importing the configuration file to pass them to the EmailAuth instance
/// You can have a custom path and a variable name,
/// but the Map should be in the pattern {server : "", serverKey : ""}
// import 'package:email_auth_example/auth.config.dart';

class verify_email extends StatefulWidget {
  @override
  _verify_emailState createState() => _verify_emailState();
}

class _verify_emailState extends State<verify_email> {
  /// The boolean to handle the dynamic operations
  bool submitValid = false;

  /// Text editing controllers to get the value from text fields
  final TextEditingController email = TextEditingController();
  final TextEditingController _otpcontroller = TextEditingController();

  // Declare the object
  EmailAuth emailAuth;

  Map<String, String> get remoteServerConfiguration => null;

  @override
  void initState() {
    super.initState();
    // Initialize the package
    emailAuth = new EmailAuth(
      sessionName: "Sample session",
    );

    /// Configuring the remote server
    emailAuth.config(remoteServerConfiguration);
  }

  /// a void function to verify if the Data provided is true
  /// Convert it into a boolean function to match your needs.
  void verify() {
    print(emailAuth.validateOtp(
        recipientMail: email.value.text, userOtp: _otpcontroller.value.text));
  }

  /// a void funtion to send the OTP to the user
  /// Can also be converted into a Boolean function and render accordingly for providers
  void sendOtp() async {
    bool result =
        await emailAuth.sendOtp(recipientMail: email.value.text, otpLength: 5);
    if (result) {
      setState(() {
        submitValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 10,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Verifikasi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140, left: 20, right: 20),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Kami akan mengirim kode verifikasi kepada anda. Silahkan masukkan kode dibawah ini",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: Center(
                child: Center(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: email,
                  ),
                  Card(
                    margin: EdgeInsets.only(top: 20),
                    elevation: 6,
                    child: Container(
                      height: 50,
                      width: 200,
                      color: Colors.green[400],
                      child: GestureDetector(
                        onTap: sendOtp,
                        child: Center(
                          child: Text(
                            "Request OTP",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  (submitValid)
                      ? TextField(
                          controller: _otpcontroller,
                        )
                      : Container(height: 1),
                  (submitValid)
                      ? Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 50,
                          width: 200,
                          color: Colors.green[400],
                          child: GestureDetector(
                            onTap: verify,
                            child: Center(
                              child: Text(
                                "Verify",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(height: 1)
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
