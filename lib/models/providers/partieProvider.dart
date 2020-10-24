import 'package:flutter/material.dart';
import 'package:golf_app/models/interfaces/trouModel.dart';
import 'package:golf_app/models/providers/trousProvider.dart';

class PartieProvider with ChangeNotifier {
  List<TrouModel> _trous;
  PartieProvider(List<TrouModel> trous) : _trous = trous;
  int _currentHole = 0;

  //getters
  List<TrouModel> get trous => _trous;
  int get currentHole => _currentHole;
  bool get isFirstHole => _currentHole == 0;
  bool get isLastHole => _currentHole == _trous.length - 1;

  void nextHole() {
    if (_currentHole < _trous.length) {
      _currentHole++;
      notifyListeners();
    }
  }

  void previousHole() {
    if (_currentHole > 0) {
      _currentHole--;
      notifyListeners();
    }
  }
}
