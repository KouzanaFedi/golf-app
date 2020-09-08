import 'package:flutter/material.dart';

class Club extends StatelessWidget {
  final int index;

  Club({@required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
