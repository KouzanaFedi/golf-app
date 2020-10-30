import 'package:flutter/material.dart';

class Distences extends StatelessWidget {
  final int white, blue, red, yellow;
  Distences({this.blue, this.red, this.white, this.yellow});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[4],
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 15,
      ),
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
