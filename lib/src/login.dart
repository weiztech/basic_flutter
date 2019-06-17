import 'package:flutter/material.dart';

import 'screens/login_page.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Here"),
      ),
      body: LoginPage(title: "SIGN X HERE"),
      // Text("HiHo Kidz", style: TextStyle(fontWeight: FontWeight.w900),,
    );
  }
}
