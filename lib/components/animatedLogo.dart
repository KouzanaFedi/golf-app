import 'package:flutter/material.dart';

class AnimatedLogo extends StatelessWidget {
  final double width;
  AnimatedLogo({this.width = 75});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/golfLogo.png",
      height: width,
      width: width,
    );
  }
}
