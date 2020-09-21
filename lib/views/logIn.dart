import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => LogIn(),
      );
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Login"),
      ),
    );
  }
}
