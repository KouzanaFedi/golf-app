import 'dart:async';

import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/partie.dart';
import 'package:golf_app/components/partie/palyerScoreCard.dart';
import 'package:golf_app/models/interfaces/playerScoreProfile.dart';
import 'package:golf_app/models/interfaces/trouModel.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:golf_app/views/splashScreen.dart';
import 'package:provider/provider.dart';

class ScoreHole extends StatefulWidget {
  final int scoreId, nbJoueurs;
  ScoreHole({this.scoreId, this.nbJoueurs});
  static Route<dynamic> route(int scoreId, int nbJoueurs) => MaterialPageRoute(
      builder: (context) => ScoreHole(
            scoreId: scoreId,
            nbJoueurs: nbJoueurs,
          ));

  @override
  _ScoreHoleState createState() => _ScoreHoleState();
}

class _ScoreHoleState extends State<ScoreHole> {
  StreamController<List<PlayerScoreProfile>> _controller;
  final Partie _partie = Partie.getInstance();
  Timer _timer;
  bool loading = false, streamEmpty = true;

  @override
  void initState() {
    super.initState();
    _controller = StreamController();
    _timer = Timer.periodic(Duration(milliseconds: 3500), (timer) {
      _partie.fetchPlayersHoleScore(widget.scoreId).then((value) {
        if (value.length < widget.nbJoueurs || streamEmpty) {
          _controller.add(value);
          streamEmpty = true;
        } else {
          stopStream();
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    stopStream();
  }

  stopStream() {
    _timer.cancel();
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final partieProvider = Provider.of<PartieProvider>(context);
    final TrouModel trou = partieProvider.trous[partieProvider.currentHole];
    Widget nextHoleButton() => Container(
          margin: EdgeInsets.only(left: 25, right: 25),
          child: FlatButton(
            splashColor: Colors.amber,
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            onPressed: () async {
              setState(() {
                loading = true;
              });
              await partieProvider.goToNextHole();
              setState(() {
                loading = false;
              });
              Navigator.of(context).pop();
            },
            child: Container(
              width: MediaQuery.of(context).size.width * .8,
              alignment: Alignment.center,
              child: loading
                  ? Center(
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Text(
                      "Passer au trou suivant",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ),
          ),
        );
    Widget endPartieButton() => Container(
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
              Navigator.of(context).pushAndRemoveUntil(
                SplashScreen.route(),
                (Route<dynamic> route) => false,
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * .8,
              alignment: Alignment.center,
              child: loading
                  ? Center(
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Text(
                      "Fin partie",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ),
          ),
        );
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
                stream: _controller.stream,
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
                          return (snapshot.data.length <
                                  partieProvider.partieData.nbJoueurs)
                              ? Container(
                                  child: Text(
                                  partieProvider.partieData.nbJoueurs
                                      .toString(),
                                ))
                              : (partieProvider.isLastHole)
                                  ? nextHoleButton()
                                  : endPartieButton();
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
