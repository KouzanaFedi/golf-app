import 'package:flutter/material.dart';

class Copyrights extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Text(
        "© Golf course app 2020. All rights reserved.",
        style: TextStyle(
          fontSize: 10,
          color: Colors.white,
        ),
      ),
    );
  }
}
