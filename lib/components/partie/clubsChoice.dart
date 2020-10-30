import 'package:flutter/material.dart';
import 'package:golf_app/components/partie/clubOption.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:provider/provider.dart';

class ClubsChoice extends StatelessWidget {
  Widget chosenClub(String name, String image) => Padding(
        padding: EdgeInsets.only(bottom: 5, left: 15),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 2.5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: kElevationToShadow[2],
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(7),
                alignment: Alignment.center,
                child: Image.asset("$image"),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35),
                child: Text(
                  name,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    final partieProvider = Provider.of<PartieProvider>(context);
    int holeNb = partieProvider.currentHole;
    int shotNb = partieProvider.currentShot;
    final shot = partieProvider.holePlayed[holeNb].shots[shotNb];
    ThemeData _expansionTileTheme = Theme.of(context).copyWith(
      dividerColor: Colors.transparent,
    );

    List<Widget> list = [];
    for (var item in partieProvider.myClubs) {
      list.add(ClubOption(
        name: item.nom,
        image: item.clubHeadAsset,
        id: item.id,
      ));
    }

    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Theme(
        data: _expansionTileTheme,
        child: ExpansionTile(
          tilePadding: EdgeInsets.only(right: 16),
          childrenPadding: EdgeInsets.only(top: 5),
          title: shot.clubId == null
              ? Container(
                  padding: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    border: BorderDirectional(
                      bottom: BorderSide(
                        color: Color(0xFFE8EBF0),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/club_icon.png",
                        scale: 1.5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "Choisir un batton",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF9AA6AC),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : chosenClub(
                  partieProvider.myClubs
                      .firstWhere((element) => element.id == shot.clubId)
                      .nom,
                  partieProvider.myClubs
                      .firstWhere((element) => element.id == shot.clubId)
                      .clubHeadAsset,
                ),
          children: [...list],
        ),
      ),
    );
  }
}
