import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/ressource.dart';
import 'package:golf_app/models/interfaces/club.dart';

class GolfBagProvider with ChangeNotifier {
  List<Club> _availableClubs = [];
  List<Club> _myClubs = [];
  int _max = 14;

  GolfBagProvider() {
    initAvailableClubs();
    initSac();
  }

  List<Club> get availableClubs => _availableClubs;
  List<Club> get myClubs => _myClubs;
  int get max => _max;

  void initAvailableClubs() {
    Ressource.getInstance().fetchAvailableClubs().then((value) {
      _availableClubs = value;
      notifyListeners();
    });
  }

  void initSac() {
    Ressource.getInstance().fetchConetnuSac().then((value) {
      _myClubs = value;
      notifyListeners();
    });
  }

  bool alreadyHave(Club club) {
    for (var c in _myClubs) {
      if (club.id == c.id) {
        return true;
      }
    }
    return false;
  }

  void addToMyClubs(Club club) {
    if (_myClubs.length < _max && !alreadyHave(club)) {
      _myClubs.add(club);
    }
    notifyListeners();
  }

  void deleteFromMyClubs(Club club) {
    if (alreadyHave(club)) {
      _myClubs.removeWhere((element) => element.id == club.id);
    }
    notifyListeners();
  }
}
