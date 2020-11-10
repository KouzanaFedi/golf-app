import 'package:flutter/material.dart';
import 'package:golf_app/models/interfaces/shotModel.dart';

class HolePlayed {
  List<ShotModel> shots;
  bool finished;
  int scoreId;
  final int holeIndex;

  HolePlayed({
    @required this.holeIndex,
    this.finished = false,
    this.scoreId,
    this.shots,
  });

//setters
  void addShot(int i) {
    shots.add(ShotModel(shotNumber: i));
  }

  void setScoreId(int id) {
    scoreId = id;
  }

  factory HolePlayed.fromJSON(Map<String, dynamic> data) {
    List<ShotModel> _shots = [];
    List<dynamic> shotsData = data["shots"];
    if (shotsData.isNotEmpty) {
      shotsData.forEach((element) {
        _shots.add(ShotModel.fromJSON(element));
      });
    }

    return HolePlayed(
      holeIndex: data["holeId"] as int,
      finished: data["finished"] as bool,
      scoreId: (data["scoreId"] != null) ? data["scoreId"] : null,
      shots: _shots,
    );
  }

  Map<String, dynamic> toJSON() {
    List<Map<String, dynamic>> listOfShots = [];
    shots.forEach((element) {
      listOfShots.add(element.toJSON());
    });
    return {
      "finished": finished,
      "scoreId": scoreId,
      "holeId": holeIndex,
      "shots": listOfShots,
    };
  }
}
