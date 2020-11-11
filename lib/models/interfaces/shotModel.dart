import 'package:flutter/material.dart';

class ShotModel {
  int clubId, methodId, scoreUnitId;
  final int shotNumber;
  bool penality, sandSave, inHole, _send = false;

  ShotModel({
    @required this.shotNumber,
    this.clubId,
    this.inHole = false,
    this.methodId,
    this.penality = false,
    this.sandSave = false,
    this.scoreUnitId,
  });

  //getters

  bool get send => _send;
  bool get canSubmitShot => clubId != null && methodId != null;
  bool get canModifyShot => canSubmitShot && send;
  //setters

  void setClubId(int id) {
    clubId = id;
  }

  void setMethodId(int id) {
    methodId = id;
  }

  void setpenality() {
    penality = !penality;
  }

  void setSandSave() {
    sandSave = !sandSave;
  }

  void setinHole() {
    inHole = !inHole;
  }

  setUnitId(int i) {
    scoreUnitId = i;
  }

  setSend() {
    _send = true;
  }

  factory ShotModel.fromJSON(Map<String, dynamic> data) {
    return ShotModel(
      shotNumber: data["shotNumber"] as int,
      clubId: data["clubId"] as int,
      inHole: data["inHole"] as bool,
      methodId: data["methodId"] as int,
      penality: data["penality"] as bool,
      sandSave: data["sandSave"] as bool,
      scoreUnitId: (data["scoreUnitId"] != null) ? data["scoreUnitId"] : null,
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      "clubId": clubId,
      "methodId": methodId,
      "shotNumber": shotNumber,
      "penality": penality,
      "sandSave": sandSave,
      "inHole": inHole,
      "scoreUnitId": scoreUnitId,
    };
  }
}
