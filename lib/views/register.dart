import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => Register(),
      );
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Register"),
      ),
    );
  }
}
