import 'package:flutter/material.dart';
import 'package:golf_app/components/partie/generalScore/scoreHeader.dart';
import 'package:golf_app/components/partie/generalScore/scoreTable.dart';
import 'package:golf_app/models/interfaces/joueur.dart';
import 'package:golf_app/models/interfaces/scoreGeneralModel.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:golf_app/views/interScreen1.dart';
import 'package:provider/provider.dart';

class GeneralScore extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => GeneralScore());
  @override
  Widget build(BuildContext context) {
    final partieProvider = Provider.of<PartieProvider>(context, listen: false);
    final List<Joueur> joueurs = Provider.of<UserProvider>(context).listJoueur;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<ScoreGeneralModel>>(
          future: partieProvider.fetchGeneralScore(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.isEmpty) {
                return Center(
                    child: Text(
                  "Erreur Serveur.",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ));
              } else
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ScoreHeader(),
                      ScoreTable(listOfScores: snapshot.data, joueurs: joueurs),
                      partieProvider.islastHoleInGame
                          ? Container(
                              margin: EdgeInsets.only(left: 25, right: 25),
                              child: FlatButton(
                                splashColor: Colors.amber,
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  partieProvider.computePartieStats();
                                  partieProvider.clearGame();
                                  Navigator.of(context).pushAndRemoveUntil(
                                      InterScreen1.route(), (route) => false);
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .8,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Fin partie",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 150,
                                child: FlatButton(
                                  splashColor: Colors.transparent,
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {
                                    partieProvider.sharedPrefDebug();
                                    partieProvider.computePartieStats();
                                    partieProvider.clearGame();
                                    partieProvider.sharedPrefDebug();
                                    Navigator.of(context).pushAndRemoveUntil(
                                        InterScreen1.route(), (route) => false);
                                  },
                                  child: Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Quitter partie",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Icon(
                                            Icons.exit_to_app,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
