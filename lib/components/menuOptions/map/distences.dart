import 'package:flutter/material.dart';

class Distences extends StatelessWidget {
  final int white, blue, red, yellow;
  final double top, left;
  Distences(
      {this.blue, this.red, this.white, this.yellow, this.left, this.top});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: kElevationToShadow[4],
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Text(
                    white.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF9AA6AC),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Image.asset(
                      "assets/holes/whiteFlag.png",
                      scale: 1.35,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Text(
                    blue.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF9AA6AC),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Image.asset(
                      "assets/holes/blueFlag.png",
                      scale: 1.35,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Text(
                    yellow.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF9AA6AC),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Image.asset(
                      "assets/holes/yellowFlag.png",
                      scale: 1.35,
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  red.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF9AA6AC),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Image.asset(
                    "assets/holes/redFlag.png",
                    scale: 1.35,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
