import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/partie.dart';
import 'package:golf_app/models/interfaces/joueur.dart';
import 'package:golf_app/models/interfaces/partieModel.dart';
import 'package:golf_app/models/interfaces/user.dart';

class UserProvider with ChangeNotifier {
  User _user;
  PartieModel _partieModel;
  Partie _partie = Partie.getInstance();
  List<Joueur> _listJoueur = [];

  UserProvider() {
    setPartie();
  }

  User get user => _user;
  PartieModel get partieModel => _partieModel;
  bool get havePartie => _partieModel != null;
  List<Joueur> get listJoueur => _listJoueur;

  void setUser(User user) {
    _user = user;

    notifyListeners();
  }

  void setPartie() async {
    _partieModel = await _partie.getPartie();
    setListJoueur();
  }

  void setListJoueur() async {
    if (havePartie) {
      _listJoueur = await _partie.getJoueurs(_partieModel.id);
    }
  }
}
