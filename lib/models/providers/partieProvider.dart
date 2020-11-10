import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/partie.dart';
import 'package:golf_app/models/interfaces/club.dart';
import 'package:golf_app/models/interfaces/holePlayed.dart';
import 'package:golf_app/models/interfaces/methodJeu.dart';
import 'package:golf_app/models/interfaces/partieModel.dart';
import 'package:golf_app/models/interfaces/playerScoreProfile.dart';
import 'package:golf_app/models/interfaces/scoreGeneralModel.dart';
import 'package:golf_app/models/interfaces/shotModel.dart';
import 'package:golf_app/models/interfaces/trouModel.dart';
import 'package:golf_app/utils/sharedPref.dart';

class PartieProvider with ChangeNotifier {
  final Partie partie = Partie.getInstance();
  SharedPref _pref;
  final List<TrouModel> trous;
  final List<Club> myClubs;
  final List<MethodJeu> methods;
  final PartieModel partieData;
  int _key;
  int _currentHole = 0;
  int _currentShot = 0;
  List<HolePlayed> _holesHistory = [];

  PartieProvider({this.trous, this.myClubs, this.methods, this.partieData}) {
    init();
    collapse();
  }

  //getters
  int get key => _key;
  int get currentHole => _currentHole;
  int get currentShot => _currentShot;
  bool get isFirstHole => _currentHole == 0;
  bool get isLastHole => _currentHole == _holesHistory.length - 1;
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
    notifyListeners();
  }

  void startHole() {
    if (_holesHistory.length < _currentHole + 1) {
      _holesHistory.add(HolePlayed(holeIndex: _currentHole));
    }
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

  Future<void> submitShot() async {
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

    if (shot.inHole && _holesHistory.length < trous.length) {
      HolePlayed hole = HolePlayed(
        holeIndex: _currentHole + 2,
        shots: [
          ShotModel(shotNumber: 1),
        ],
      );
      initScoreHole(hole, partieData.id);
      _holesHistory.add(hole);
    } else if (!shot.inHole) {
      _holesHistory[_currentHole].shots.add(
            ShotModel(
              shotNumber: _currentShot + 2,
              penality: isPenality(shot.methodId),
              sandSave: isSandSave(shot.methodId),
            ),
          );
    }

    _pref.storeGameHistory(jsonEncode(toJSON()));
    print(_pref.getGameHistory());
  }

  Future<void> updateShot() async {
    HolePlayed hole = _holesHistory[_currentHole];
    ShotModel shot = hole.shots[_currentShot];
    await partie.updateShot(shot.clubId, shot.methodId, shot.scoreUnitId,
        shot.inHole, shot.penality, shot.sandSave);
    if (shot.inHole) {
      do {
        hole.shots.removeLast();
      } while (hole.shots.length > shot.shotNumber);
      if (_holesHistory.length < trous.length) {
        HolePlayed hole = HolePlayed(
          holeIndex: _currentHole + 2,
          shots: [
            ShotModel(shotNumber: 1),
          ],
        );
        await initScoreHole(hole, partieData.id);
        _holesHistory.add(hole);
      }
    } else {
      if (hole.shots.length == shot.shotNumber) {
        _holesHistory.removeLast();
        hole.shots.add(
          ShotModel(
            shotNumber: shot.shotNumber + 1,
            penality: isPenality(shot.methodId),
            sandSave: isSandSave(shot.methodId),
          ),
        );
      }
    }

    notifyListeners();
    _pref.storeGameHistory(jsonEncode(toJSON()));
    debugPrint(_pref.getGameHistory());
  }

  void sendShot(ShotModel shot, int i) {
    shot.setSend(i);
    notifyListeners();
  }

  void deleteGameHistory() {
    _pref.deleteGameHistory();
    print("game history exists: " + _pref.gameHistoryExists().toString());
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

  StreamController<List<PlayerScoreProfile>> holeScoreStream() {
    StreamController<List<PlayerScoreProfile>> stream = StreamController();
    Timer.periodic(Duration(milliseconds: 3500), (_) {
      partie
          .fetchPlayersHoleScore(_holesHistory[_currentHole].scoreId)
          .then((value) {
        if (value.length < partieData.nbJoueurs) {
          stream.add(value);
        } else
          stream.close();
      });
    });
    return stream;
  }
}
