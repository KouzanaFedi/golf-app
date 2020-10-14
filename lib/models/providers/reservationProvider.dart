import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/reservation.dart';
import 'package:golf_app/models/interfaces/locationItem.dart';
import 'package:golf_app/models/interfaces/matche.dart';
import 'package:golf_app/models/interfaces/reservationModel.dart';

class ReservationProvider with ChangeNotifier {
  List<Matche> _matches = [];
  List<LocationItem> _locationItems = [];
  List<int> _itemsLocatedId = [];
  String _time, _date;
  Matche _matche;
  double _tarif;
  final Reservation _reservation = Reservation.getInstance();
  ReservationModel _reservationModel;
  bool _done = false;

  ReservationProvider() {
    initMatches();
    initLocationItems();
  }

  void setDone() {
    if (_done == false) _done = true;
    notifyListeners();
  }

  void setUndone() {
    if (_done == true) _done = false;
    notifyListeners();
  }

  //getters
  List<Matche> get matches => _matches;
  List<LocationItem> get locationItem => _locationItems;
  List<int> get itemsLocatedId => _itemsLocatedId;
  String get date => _date;
  String get time => _time;
  bool get haveMatche => (_matche != null);
  double get tarif => haveMatche ? _tarif : 0;
  bool get canReserve => (_date != null && _time != null && haveMatche);
  ReservationModel get reservationModel => _reservationModel;
  bool get haveReservation => _reservationModel != null;
  bool get done => _done;

  bool alreadyLocated(int id) {
    return _itemsLocatedId.contains(id);
  }

  LocationItem getLocatedItemById(int id) {
    return _locationItems.firstWhere((element) => element.id == id);
  }

  void addLocation(int id) async {
    if (!alreadyLocated(id) && haveReservation) {
      String res = await _reservation.addLocation(id, reservationModel.id);
      if (res == "sucess") {
        itemsLocatedId.add(id);
        _tarif = _tarif + double.parse(locationItem[id - 1].tarif);
      }
      notifyListeners();
    }
  }

  void deleteLocation(int id) async {
    if (alreadyLocated(id) && haveReservation) {
      String res = await _reservation.deleteLocation(id, reservationModel.id);
      if (res == "sucess") {
        itemsLocatedId.remove(id);
        _tarif = _tarif - double.parse(locationItem[id - 1].tarif);
      }
      notifyListeners();
    }
  }

  void initMatches() async {
    _matches = await _reservation.fetchAvailableMatches();
    notifyListeners();
  }

  void initLocationItems() async {
    _locationItems = await _reservation.fetchAvailableLocations();
    notifyListeners();
  }

  void setMatche(int index) {
    if (index == 0) {
      _matche = null;
    } else {
      for (var m in _matches) {
        if (m.id == index) {
          _matche = m;
          _tarif = double.parse(m.tarif);
          break;
        }
      }
    }
    notifyListeners();
  }

  void setDate(int year, int month, int day) {
    String value =
        "$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}";

    _date = value;
    notifyListeners();
  }

  void setTime(int hour, int minute) {
    _time =
        "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";

    notifyListeners();
  }

  Future<void> createReservation() async {
    String fullDate = _date + " " + _time;
    _reservationModel =
        await _reservation.createReservation(fullDate, _matche.id);
    notifyListeners();
  }
}
