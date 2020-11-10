import 'package:flutter/material.dart';
import 'package:golf_app/components/partie/palyerScoreCard.dart';
import 'package:golf_app/models/interfaces/playerScoreProfile.dart';
import 'package:golf_app/models/interfaces/trouModel.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:golf_app/views/splashScreen.dart';
import 'package:provider/provider.dart';

class ScoreHole extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => ScoreHole());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final partieProvider = Provider.of<PartieProvider>(context);
    final TrouModel trou = partieProvider.trous[partieProvider.currentHole];
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.primaryColor,
        body: Column(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 40),
                  alignment: Alignment.center,
                  child: Text(
                    "Trou ${trou.number}\nPar ${trou.par} / Index ${trou.strokeIndex.toString()}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .75,
              child: StreamBuilder<List<PlayerScoreProfile>>(
                stream: partieProvider.holeScoreStream().stream,
                builder: (context, snapshot) {
                  debugPrint(snapshot.connectionState.toString());
                  debugPrint(snapshot.data.toString());
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else
                    return ListView.builder(
                      itemCount: snapshot.data.length + 1,
                      itemBuilder: (context, index) {
                        if (index < snapshot.data.length) {
                          PlayerScoreProfile profile = snapshot.data[index];
                          return PlayerScoreCard(
                            name: profile.name,
                            image: profile.image,
                            order: index + 1,
                            score: profile.score,
                            type: profile.type,
                          );
                        } else {
                          return Container(
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
                                // if (partieProvider.isLastHole) {
                                //   Navigator.of(context).pushAndRemoveUntil(
                                //     SplashScreen.route(),
                                //     (Route<dynamic> route) => false,
                                //   );
                                // } else
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * .8,
                                alignment: Alignment.center,
                                child: Text(
                                  partieProvider.isLastHole
                                      ? "Fin partie"
                                      : "Passer au trou suivant",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
