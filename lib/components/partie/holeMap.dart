import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/map/distences.dart';
import 'package:golf_app/components/partie/partieBottomSheet.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:golf_app/views/fullScreenMap.dart';
import 'package:golf_app/views/generalScore.dart';
import 'package:golf_app/views/scoreHole.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class HoleMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    final partieProvider = Provider.of<PartieProvider>(context);
    int holeNb = partieProvider.currentHole;
    final trou = partieProvider.trous[holeNb];
    int shotNb = partieProvider.currentShot;
    final shot = partieProvider.holePlayed[holeNb].shots[shotNb];

    return Container(
      width: screenSize.width,
      height: screenSize.height - 200,
      child: Stack(
        children: [
          Container(
            width: screenSize.width,
            padding: EdgeInsets.all(20),
            child: Image.asset(
              "assets/holes/${trou.image2D}",
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            right: 15,
            bottom: 25,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: FloatingActionButton(
                        heroTag: "coups",
                        backgroundColor: Colors.red,
                        splashColor: Colors.amber,
                        onPressed: () {
                          showBarModalBottomSheet(
                            barrierColor: Colors.grey.withOpacity(.5),
                            isDismissible: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(50),
                                topEnd: Radius.circular(50),
                              ),
                            ),
                            context: context,
                            builder: (context, controller) =>
                                PartieBottomSheet(),
                          );
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(text: "#${shot.shotNumber} \n"),
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
                        )),
                  ),
                ),
                Distences(
                  blue: trou.dtBlue,
                  red: trou.dtRed,
                  white: trou.dtWhite,
                  yellow: trou.dtYellow,
                ),
                // ),
              ],
            ),
          ),
          Positioned(
            left: 15,
            top: 100,
            child: SizedBox(
              width: 50,
              height: 50,
              child: FloatingActionButton(
                heroTag: "score",
                backgroundColor: theme.primaryColor,
                splashColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(GeneralScore.route());
                },
                child: Icon(
                  Icons.table_chart,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            left: 15,
            top: 40,
            child: SizedBox(
              width: 50,
              height: 50,
              child: FloatingActionButton(
                  heroTag: "map",
                  backgroundColor: Colors.white,
                  splashColor: Colors.grey,
                  onPressed: () {
                    Navigator.of(context).push(FullScreenMap.route());
                  },
                  child: Text(
                    "Map",
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
