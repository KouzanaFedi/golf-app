import 'package:flutter/material.dart';
import 'package:golf_app/components/partie/generalScore/labelRow.dart';
import 'package:golf_app/components/partie/generalScore/scoreRow.dart';
import 'package:golf_app/models/interfaces/scoreGeneralModel.dart';

class ScoreTable extends StatelessWidget {
  final List<ScoreGeneralModel> listOfScores;
  ScoreTable({this.listOfScores});

  @override
  Widget build(BuildContext context) {
    bool eighteenShots = listOfScores[0].score.length == 18;
    List<Map<String, String>> playersData = [];
    List<List<int>> firstHalfScores = [];
    List<List<int>> lastHalfScores = [];
    listOfScores.forEach((element) {
      playersData.add({
        "name": element.name,
        "image": element.image,
      });
      firstHalfScores.add(element.score.sublist(0, 9));
      if (eighteenShots) {
        lastHalfScores.add(element.score.sublist(9));
      }
    });
    return Container(
      margin: EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 15),
                child: Text(
                  "Aller",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelRow(
                    playersData: playersData,
                  ),
                  ScoreRow(firstHalf: true, scores: firstHalfScores),
                ],
              ),
            ],
          ),
          (eighteenShots)
              ? Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(bottom: 15),
                        child: Text(
                          "Retour",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabelRow(
                            playersData: playersData,
                          ),
                          ScoreRow(firstHalf: false, scores: lastHalfScores),
                        ],
                      )
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
