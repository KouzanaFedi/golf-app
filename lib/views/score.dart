import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => Score());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            BackButton(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
