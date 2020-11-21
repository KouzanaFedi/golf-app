import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/map/distences.dart';
import 'package:golf_app/models/interfaces/trouModel.dart';

class HoleCard extends StatelessWidget {
  final TrouModel trou;
  HoleCard({this.trou});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 300,
          height: 400,
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Image.asset(
            "assets/holes/${trou.smallImage}",
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: trou.fTop,
          left: trou.fLeft,
          child: Distences(
            blue: trou.dtBlue,
            red: trou.dtRed,
            white: trou.dtWhite,
            yellow: trou.dtYellow,
          ),
        ),
        Positioned(
          top: trou.sTop,
          left: trou.sLeft,
          child: Container(
            width: 70,
            height: 70,
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Trou ${trou.number}",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.red,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Par  ",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                          fontSize: 13),
                    ),
                    Text(
                      "${trou.par}",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Index  ",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                          fontSize: 13),
                    ),
                    Text(
                      "${trou.strokeIndex}",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
