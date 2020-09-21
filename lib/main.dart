import 'package:flutter/material.dart';
import 'package:golf_app/views/bagView.dart';
import 'package:golf_app/views/home.dart';
import 'package:golf_app/views/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF2ED199),
        textSelectionColor: Color(0xFF9EAAB0),
      ),
      home: Home(),
    );
  }
}
