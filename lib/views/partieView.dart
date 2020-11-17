import 'package:flutter/material.dart';
import 'package:golf_app/components/partie/holeHeader.dart';
import 'package:golf_app/components/partie/holeMap.dart';
import 'package:golf_app/components/partie/metaInfo.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:golf_app/views/scoreHole.dart';
import 'package:provider/provider.dart';

class PartieView extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => PartieView());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Consumer<PartieProvider>(
          builder: (context, value, child) {
            print("in hole : " +
                value.holePlayed.last.shots.last.inHole.toString());
            print("in send : " +
                (value.holePlayed.last.shots.last.scoreUnitId != null)
                    .toString());
            print("length : " +
                (value.holePlayed.length < value.trous.length).toString());
            if (value.trous.length == 0) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (value.holePlayed.last.shots.last.inHole &&
                value.holePlayed.last.shots.last.scoreUnitId != null) {
              return ScoreHole(
                nbJoueurs: value.partieData.nbJoueurs,
                scoreId: value.holePlayed.last.scoreId,
              );
            } else
              return Column(
                children: [
                  HoleHeader(),
                  MetaInfo(),
                  HoleMap(),
                ],
              );
          },
        ),
      ),
    );
  }
}
