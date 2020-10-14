import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/bag/bag.dart';
import 'package:golf_app/components/menuOptions/bag/clubs.dart';
import 'package:golf_app/models/providers/golfBagProvider.dart';
import 'package:provider/provider.dart';

class Sac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "Pour modifier le contenu de votre sac de golf, faites un glisser-déposer des clubs dans le sac du golf.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Container(
          width: 300,
          height: 320,
          child: Row(
            children: [
              Bag(),
              Clubs(),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: FlatButton(
            splashColor: Colors.white,
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            onPressed: () {
              Provider.of<GolfBagProvider>(context, listen: false)
                  .availableClubs
                  .forEach((element) {
                debugPrint("id: ${element.id}, nom: ${element.nom}");
              });
            },
            child: Container(
              height: 50,
              width: 220,
              alignment: Alignment.center,
              child: Text(
                "Valider",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
