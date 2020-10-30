import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:provider/provider.dart';

class RadioBoxes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final partieProvider = Provider.of<PartieProvider>(context);
    int holeNb = partieProvider.currentHole;
    int shotNb = partieProvider.currentShot;
    final shot = partieProvider.holePlayed[holeNb].shots[shotNb];

    return Container(
      child: Row(
        children: [
          Checkbox(
            activeColor: theme.primaryColor,
            value: shot.penality,
            onChanged: (value) {
              partieProvider.changePenality();
            },
          ),
          Text(
            "Pinalité",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Checkbox(
              activeColor: theme.primaryColor,
              value: shot.sandSave,
              onChanged: (value) {
                partieProvider.changeSandSave();
              },
            ),
          ),
          Text(
            "Sand save",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
