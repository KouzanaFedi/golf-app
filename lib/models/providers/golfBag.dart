import 'package:flutter/material.dart';

class GolfBag with ChangeNotifier {
  List<int> _availableClubs = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17
  ];
  List<int> _myClubs = [];
  int _max = 14;

  List<int> get availableClubs => _availableClubs;
  List<int> get myClubs => _myClubs;
  int get max => _max;

  bool alreadyHave(int club) => _myClubs.contains(club);

  void addToMyClubs(int club) {
    if (_myClubs.length < _max && !alreadyHave(club)) {
      _myClubs.add(club);
    }
    notifyListeners();
  }

  void deleteFromMyClubs(int club) {
    if (alreadyHave(club)) {
      _myClubs.remove(club);
    }
    notifyListeners();
  }
}
