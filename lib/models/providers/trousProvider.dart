import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:golf_app/api/requests/ressource.dart';
import 'package:golf_app/models/interfaces/trouModel.dart';

class TrouProvider with ChangeNotifier {
  List<TrouModel> _trouList = [];
  int _page = 0;
  bool _is2DView = true;
  TrouProvider() {
    loadTrou();
  }

  List<TrouModel> get trouList => _trouList;
  bool get is2DView => _is2DView;
  int get page => _page;

  setPage(int index) {
    if (_page != index - 1) {
      _page = index - 1;
      notifyListeners();
    }
  }

  void setMapView() {
    if (_is2DView) {
      _is2DView = false;
      notifyListeners();
    }
  }

  void set2DView() {
    if (!_is2DView) {
      _is2DView = true;
      notifyListeners();
    }
  }

  void loadTrou() async {
    _trouList = await Ressource.getInstance().fetchHoles();
    await addLatLongToTrou();
  }

  Future<void> addLatLongToTrou() async {
    String _fileContent = await rootBundle.loadString("assets/holes.json");
    List json = jsonDecode(_fileContent);
    json.forEach((element) {
      double lat = element["latitude"];
      double long = element["longitude"];
      double rotation = element["rotation"];
      double fTop = element["fTop"];
      double fLeft = element["fLeft"];
      double sTop = element["sTop"];
      double sLeft = element["sLeft"];
      TrouModel trou =
          _trouList.firstWhere((trou) => trou.number == element["order"]);
      trou.setLatLong(lat, long);
      trou.setRotation(rotation);
      trou.setFlagsPos(fTop, fLeft);
      trou.setStatsPos(sTop, sLeft);
    });
    notifyListeners();
  }
}
