import 'package:flutter/material.dart';

class AnimatedLogo extends StatelessWidget {
  final double width;
  AnimatedLogo({this.width = 75});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width,
      width: width,
      child: Image.asset(
        "assets/golfLogo.png",
      ),
    );
  }
}
