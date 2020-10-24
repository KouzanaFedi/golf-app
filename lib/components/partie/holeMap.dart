import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/map/distences.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:golf_app/views/fullScreenMap.dart';
import 'package:golf_app/views/score.dart';
import 'package:provider/provider.dart';

class HoleMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final partieProvider = Provider.of<PartieProvider>(context);
    final trou = partieProvider.trous[partieProvider.currentHole];
    final theme = Theme.of(context);
    return Container(
      width: screenSize.width,
      height: screenSize.height - 210,
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
            left: screenSize.width - 100,
            top: screenSize.height - 420,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: FloatingActionButton(
                        heroTag: "coups",
                        backgroundColor: Colors.red,
                        splashColor: Colors.amber,
                        onPressed: () {},
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(text: "#5 \n"),
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
                  Navigator.of(context).push(Score.route());
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
