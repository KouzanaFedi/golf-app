import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/ressource.dart';
import 'package:golf_app/models/interfaces/club.dart';

class GolfBagProvider with ChangeNotifier {
  List<Club> _availableClubs = [];
  List<Club> _myClubs = [];
  List<int> _changedListTracker = [];
  int _max = 14;
  List<int> _clubsMustHave = [1, 2, 7];
  Ressource _ressource = Ressource.getInstance();

  GolfBagProvider() {
    initAvailableClubs();
    initSac();
  }

  List<Club> get availableClubs => _availableClubs;
  List<Club> get myClubs => _myClubs;
  int get max => _max;
  bool get sacUpdated => _changedListTracker.length > 0;

  bool clubMustHave(int id) {
    return _clubsMustHave.contains(id);
  }

  void initAvailableClubs() {
    _ressource.fetchAvailableClubs().then((value) {
      _availableClubs = value;
      _availableClubs.shuffle();
      notifyListeners();
    });
  }

  void initSac() {
    _ressource.fetchConetnuSac().then((value) {
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

  void updateChangeTracker(int id) {
    if (_changedListTracker.contains(id))
      _changedListTracker.remove(id);
    else
      _changedListTracker.add(id);
  }

  void addToMyClubs(Club club) {
    if (_myClubs.length < _max && !alreadyHave(club)) {
      _myClubs.add(club);
    }
    updateChangeTracker(club.id);
    notifyListeners();
  }

  void deleteFromMyClubs(Club club) {
    if (alreadyHave(club)) {
      _myClubs.removeWhere((element) => element.id == club.id);
    }
    updateChangeTracker(club.id);
    notifyListeners();
  }

  List<int> getMyClubId() {
    List<int> list = [];
    for (var item in _myClubs) {
      list.add(item.id);
    }
    return list;
  }

  Future<void> submitUpdateSac() async {
    await _ressource.updateContenuSac(getMyClubId());
    _changedListTracker = [];
    notifyListeners();
  }
}
