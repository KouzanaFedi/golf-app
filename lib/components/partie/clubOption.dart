import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:provider/provider.dart';

class ClubOption extends StatelessWidget {
  final String name, image;
  final int id;
  ClubOption({this.name, this.image, this.id});
  @override
  Widget build(BuildContext context) {
    final partieProvider = Provider.of<PartieProvider>(context);
    int holeNb = partieProvider.currentHole;
    int shotNb = partieProvider.currentShot;
    final shot = partieProvider.holePlayed[holeNb].shots[shotNb];
    final bool selected = shot.clubId == id;

    return Padding(
      padding: EdgeInsets.only(bottom: 5, right: 15),
      child: FlatButton(
        color: (selected) ? Colors.grey : Colors.white,
        splashColor: (selected) ? Colors.white : Colors.grey,
        padding: EdgeInsets.symmetric(vertical: 2.5),
        onPressed: () {
          partieProvider.setClub(id);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 38),
              child: Text(
                name,
                style:
                    TextStyle(color: (selected) ? Colors.white : Colors.black),
              ),
            ),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: kElevationToShadow[2],
                color: Colors.white,
              ),
              padding: EdgeInsets.all(7),
              margin: EdgeInsets.only(right: 5),
              alignment: Alignment.center,
              child: Image.asset("$image"),
            )
          ],
        ),
      ),
    );
  }
}
