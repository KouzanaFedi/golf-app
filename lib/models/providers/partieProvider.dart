import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/partie.dart';
import 'package:golf_app/models/interfaces/club.dart';
import 'package:golf_app/models/interfaces/holePlayed.dart';
import 'package:golf_app/models/interfaces/methodJeu.dart';
import 'package:golf_app/models/interfaces/partieModel.dart';
import 'package:golf_app/models/interfaces/scoreGeneralModel.dart';
import 'package:golf_app/models/interfaces/shotModel.dart';
import 'package:golf_app/models/interfaces/trouModel.dart';
import 'package:golf_app/utils/sharedPref.dart';

class PartieProvider with ChangeNotifier {
  final Partie partie = Partie.getInstance();
  SharedPref _pref;
  List<TrouModel> trous;
  final List<Club> myClubs;
  final List<MethodJeu> methods;
  final PartieModel partieData;
  int _key;
  int _currentHole = 0;
  int _currentShot = 0;
  List<HolePlayed> _holesHistory = [];

  PartieProvider({this.trous, this.myClubs, this.methods, this.partieData}) {
    if (trous != null && partieData != null) {
      int nbTrou = int.parse(partieData.nbTrou);
      if (nbTrou < 18 && trous.length > 0) {
        trous = trous.sublist(0, nbTrou);
      }
    }
    init();
    collapse();
  }

  //getters
  int get key => _key;
  int get currentHole => _currentHole;
  int get currentShot => _currentShot;
  bool get isFirstHole => _currentHole == 0;
  bool get isLastHole => _currentHole == _holesHistory.length - 1;
  bool get islastHoleInGame => _currentHole == trous.length - 1;
  bool get isFirstShot => _currentShot == 0;
  bool get isLastShot =>
      _currentShot == _holesHistory[_currentHole].shots.length - 1;
  List<HolePlayed> get holePlayed => _holesHistory;

  Future<void> initScoreHole(HolePlayed hole, int partieId) async {
    int scoreId = await partie.initScoreHole(partieId, hole.holeIndex);
    hole.setScoreId(scoreId);
    notifyListeners();
  }

  Future<void> getSharedPref() async {
    _pref = await SharedPref.getInstance();
    if (_pref.gameHistoryExists()) {
      List<dynamic> data = jsonDecode(_pref.getGameHistory());
      List<HolePlayed> storedHistory = [];
      if (data.isNotEmpty) {
        data.forEach((element) {
          storedHistory.add(HolePlayed.fromJSON(element));
        });
        _currentHole = storedHistory.length - 1;
        _currentShot = storedHistory[_currentHole].shots.length - 1;
        _holesHistory = storedHistory;
      }
    }
  }

  init() async {
    HolePlayed firstHole = HolePlayed(holeIndex: 1, shots: [
      ShotModel(shotNumber: 1),
    ]);
    _holesHistory.add(firstHole);
    await getSharedPref();
    if (!_pref.isGameStartedExists()) {
      _pref.setGameStarted();
    }
    notifyListeners();
  }

  void startHole() {
    if (_holesHistory.length < _currentHole + 1) {
      _holesHistory.add(HolePlayed(holeIndex: _currentHole));
    }
  }

  String getClubName(int id) {
    return myClubs.singleWhere((element) => element.id == id).nom;
  }

  String getMethodName(int id) {
    return methods.singleWhere((element) => element.id == id).name;
  }

  void nextHole() {
    if (_currentHole < trous.length) {
      _currentHole++;
      _currentShot = _holesHistory[_currentHole].shots.length - 1;
      notifyListeners();
    }
  }

  void previousHole() {
    if (_currentHole > 0) {
      _currentHole--;
      _currentShot = _holesHistory[_currentHole].shots.length - 1;
      notifyListeners();
    }
  }

  void nextShot() {
    if (_currentShot < _holesHistory[_currentHole].shots.length) {
      _currentShot++;
      notifyListeners();
    }
  }

  void previousShot() {
    if (_currentShot > 0) {
      _currentShot--;
      notifyListeners();
    }
  }

  void setClub(int id) {
    _holesHistory[_currentHole].shots[_currentShot].setClubId(id);
    collapse();
    notifyListeners();
  }

  void setMethod(int id) {
    _holesHistory[_currentHole].shots[_currentShot].setMethodId(id);
    collapse();
    notifyListeners();
  }

  void changePenality() {
    _holesHistory[_currentHole].shots[_currentShot].setpenality();
    notifyListeners();
  }

  void changeSandSave() {
    _holesHistory[_currentHole].shots[_currentShot].setSandSave();
    notifyListeners();
  }

  void changeInHole() {
    _holesHistory[_currentHole].shots[_currentShot].setinHole();
    notifyListeners();
  }

  void clearGame() {
    _pref.deleteGameHistory();
    _pref.deleteGameStarted();
  }

  Future<bool> submitShot() async {
    if (isFirstHole && isFirstShot) {
      await initScoreHole(_holesHistory[0], partieData.id);
    }
    HolePlayed hole = _holesHistory[_currentHole];
    ShotModel shot = hole.shots[_currentShot];
    sendShot(
      shot,
      await partie.playShot(
        shot.clubId,
        shot.methodId,
        hole.scoreId,
        shot.inHole,
        shot.penality,
        shot.sandSave,
      ),
    );

    if (shot.inHole) {
      _pref.storeGameHistory(jsonEncode(toJSON()));
      return true;
    } else {
      _holesHistory[_currentHole].shots.add(
            ShotModel(
              shotNumber: _currentShot + 2,
              penality: isPenality(shot.methodId),
              sandSave: isSandSave(shot.methodId),
            ),
          );
      _currentShot++;
      notifyListeners();
      _pref.storeGameHistory(jsonEncode(toJSON()));
      return false;
    }
  }

  Future goToNextHole() async {
    HolePlayed hole = HolePlayed(
      holeIndex: _currentHole + 2,
      shots: [
        ShotModel(shotNumber: 1),
      ],
    );
    await initScoreHole(hole, partieData.id);
    _holesHistory.add(hole);
    _pref.storeGameHistory(jsonEncode(toJSON()));
    notifyListeners();
  }

  void goNextHoleId() {
    _currentHole++;
    notifyListeners();
  }

  void sendShot(ShotModel shot, int i) {
    shot.setUnitId(i);
    notifyListeners();
  }

  void setSendWithDelay(ShotModel shot) {
    Future.delayed(Duration(seconds: 1), () {
      shot.setSend();
      notifyListeners();
    });
  }

  void setSendWithOutDelay(ShotModel shot) {
    shot.setSend();
    notifyListeners();
  }

  bool isPenality(int id) {
    return id == 4 || id == 6;
  }

  bool isSandSave(int id) {
    return id == 2;
  }

  collapse() {
    int newKey;
    do {
      _key = new Random().nextInt(10000);
    } while (newKey == _key);
  }

  Future<List<ScoreGeneralModel>> fetchGeneralScore() async {
    return await partie.fetchGeneralScore(partieData.id);
  }

  List<Map<String, dynamic>> toJSON() {
    List<Map<String, dynamic>> listOfHoles = [];
    _holesHistory.forEach((element) {
      listOfHoles.add(element.toJSON());
    });
    return listOfHoles;
  }

  Future computePartieStats() async {
    await partie.computePartieStats(partieData.id);
  }
}
