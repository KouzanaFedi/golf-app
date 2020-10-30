import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:provider/provider.dart';

class ShotHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final partieProvider = Provider.of<PartieProvider>(context);
    int holeNb = partieProvider.currentHole;
    int shotNb = partieProvider.currentShot;
    final shot = partieProvider.holePlayed[holeNb].shots[shotNb];

    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          partieProvider.isFirstShot
              ? Container(
                  width: 50,
                  height: 50,
                )
              : ClipOval(
                  child: Material(
                    color: Colors.transparent, // button color
                    child: InkWell(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Color(0xFF9AA6AC),
                        ),
                      ),
                      onTap: () {
                        partieProvider.previousShot();
                      },
                    ),
                  ),
                ),
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            width: 50,
            height: 50,
            alignment: Alignment.center,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "#${shot.shotNumber} \n",
                  ),
                  TextSpan(
                      text: "Coups",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 8,
                      ))
                ],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          partieProvider.isLastShot
              ? Container(
                  width: 50,
                  height: 50,
                )
              : ClipOval(
                  child: Material(
                    color: Colors.transparent, // button color
                    child: InkWell(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Color(0xFF9AA6AC),
                        ),
                      ),
                      onTap: () {
                        partieProvider.nextShot();
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
