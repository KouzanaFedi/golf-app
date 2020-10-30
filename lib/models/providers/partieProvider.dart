import 'package:flutter/material.dart';
import 'package:golf_app/models/interfaces/club.dart';
import 'package:golf_app/models/interfaces/holePlayed.dart';
import 'package:golf_app/models/interfaces/methodJeu.dart';
import 'package:golf_app/models/interfaces/shotModel.dart';
import 'package:golf_app/models/interfaces/trouModel.dart';

class PartieProvider with ChangeNotifier {
  final List<TrouModel> trous;
  final List<Club> myClubs;
  final List<MethodJeu> methods;
  int _currentHole = 0;
  int _currentShot = 0;
  List<HolePlayed> _holesHistory = [
    HolePlayed(holeIndex: 1),
  ];

  PartieProvider({this.trous, this.myClubs, this.methods}) {
    // for (var i = 0; i < trous.length; i++) {
    //   _holesHistory.add(HolePlayed(holeIndex: i + 1));
    // }
  }

  //getters
  int get currentHole => _currentHole;
  int get currentShot => _currentShot;
  bool get isFirstHole => _currentHole == 0;
  bool get isLastHole => _currentHole == _holesHistory.length - 1;
  bool get isFirstShot => _currentShot == 0;
  bool get isLastShot =>
      _currentShot == _holesHistory[_currentHole].shots.length - 1;
  List<HolePlayed> get holePlayed => _holesHistory;

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
    notifyListeners();
  }

  void setMethod(int id) {
    _holesHistory[_currentHole].shots[_currentShot].setMethodId(id);
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

  void setSend() {
    _holesHistory[_currentHole].shots[_currentShot].setSend();
    notifyListeners();
  }

  void submitShot() {
    ShotModel shot = _holesHistory[_currentHole].shots[_currentShot];
    //send req

    if (shot.inHole && _holesHistory.length < trous.length) {
      _holesHistory.add(HolePlayed(holeIndex: _currentHole + 1));
    } else if (!shot.inHole) {
      _holesHistory[_currentHole]
          .shots
          .add(ShotModel(shotNumber: _currentShot + 2));
    }
    setSend();
  }
}
