import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/auth.dart';
import 'package:golf_app/api/requests/partie.dart';
import 'package:golf_app/api/requests/ressource.dart';
import 'package:golf_app/models/interfaces/clubStat.dart';
import 'package:golf_app/models/interfaces/gameStats.dart';
import 'package:golf_app/models/interfaces/joueur.dart';
import 'package:golf_app/models/interfaces/partieModel.dart';
import 'package:golf_app/models/interfaces/statistics.dart';
import 'package:golf_app/models/interfaces/user.dart';
import 'package:image_picker/image_picker.dart';

class UserProvider with ChangeNotifier {
  User _user;
  PartieModel _partieModel;
  Partie _partie = Partie.getInstance();
  Ressource _ressource = Ressource.getInstance();
  List<Joueur> _listJoueur = [];
  Statistics _statistics;
  List<GameStats> _gameStats;
  List<ClubStat> _clubStats;

  UserProvider() {
    setPartie();
  }

  User get user => _user;
  PartieModel get partieModel => _partieModel;
  bool get havePartie => _partieModel != null;
  List<Joueur> get listJoueur => _listJoueur;
  Statistics get stats => _statistics;
  List<GameStats> get gameStats => _gameStats;
  List<ClubStat> get clubStats => _clubStats;

  void setUser(User user) {
    _user = user;
  }

  Future<void> setPartie() async {
    _partieModel = await _partie.getPartie();
    setListJoueur();
    setStats();
    setGameStats();
    setClubStats();
  }

  void setListJoueur() async {
    if (havePartie) {
      _listJoueur = await _partie.getJoueurs(_partieModel.id);
    }
  }

  void setStats() async {
    _statistics = await _ressource.fetchStats();
  }

  void setClubStats() async {
    _clubStats = await _ressource.fetchClubStats();
  }

  void setGameStats() async {
    _gameStats = await _ressource.fetchGameStats();
  }

  Future<void> refreshPartie() async {
    await setPartie();
    await refreshUser();
    notifyListeners();
  }

  Future updateImage(PickedFile image) async {
    await _ressource.updateImage(image);
  }

  Future refreshUser() async {
    _user = await (await Auth.getInstance()).getUser();
    notifyListeners();
  }

  void updateInfor(String nom, String numb) {
    _user.update(nom, numb);
    notifyListeners();
  }
}
