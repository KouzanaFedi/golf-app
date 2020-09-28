import 'package:flutter/material.dart';

class HalfBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/half_background.png",
      fit: BoxFit.fitWidth,
    );
  }
}
