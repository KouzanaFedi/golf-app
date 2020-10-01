import 'package:flutter/material.dart';

class FullBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        "assets/background.png",
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
