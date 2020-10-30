import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:provider/provider.dart';

class SwitcherField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final partieProvider = Provider.of<PartieProvider>(context);
    int holeNb = partieProvider.currentHole;
    int shotNb = partieProvider.currentShot;
    final shot = partieProvider.holePlayed[holeNb].shots[shotNb];
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Balle dans le Trou",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          Transform.scale(
            scale: .7,
            child: CupertinoSwitch(
              activeColor: Theme.of(context).primaryColor,
              value: shot.inHole,
              onChanged: (value) {
                partieProvider.changeInHole();
              },
            ),
          )
        ],
      ),
    );
  }
}
