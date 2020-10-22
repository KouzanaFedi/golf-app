import 'package:flutter/material.dart';

class PartieView extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => PartieView());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
