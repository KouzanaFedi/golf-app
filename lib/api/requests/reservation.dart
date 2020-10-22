import 'package:flutter/cupertino.dart';
import 'package:golf_app/api/client.dart';
import 'package:golf_app/api/constants/endPoints.dart';
import 'package:golf_app/models/interfaces/locationItem.dart';
import 'package:golf_app/models/interfaces/matche.dart';
import 'package:golf_app/models/interfaces/reservationModel.dart';

class Reservation {
  static Reservation _instance;
  Client _client = Client.getInstance();

  static Reservation getInstance() {
    if (_instance == null) _instance = Reservation();
    return _instance;
  }

  Future<List<Matche>> fetchAvailableMatches() async {
    List<Matche> list = [];
    try {
      List<dynamic> json = await _client.get(AVAILABLE_MATCHES);
      if (json.length > 0) {
        for (var item in json) {
          list.add(Matche.fromJSON(item));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return list;
  }

  Future<ReservationModel> createReservation(String date, int matche) async {
    Map<String, dynamic> json = await _client.post(CREATE_RESERVATION,
        data: {"match_id": matche, "date_matche": date});
    return ReservationModel.fromJSON(json["data"]);
  }

  Future<List<LocationItem>> fetchAvailableLocations() async {
    List<LocationItem> list = [];
    try {
      List<dynamic> json = (await _client.get(AVAILABLE_LOCATIONS))["data"];
      if (json.length > 0) {
        for (var item in json) {
          list.add(LocationItem.fromJSON(item));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return list;
  }

  Future<String> addLocation(int locationId, int reservationId) async {
    Map<String, dynamic> res =
        await _client.post(ADD_LOCATION_TO_RESERVATION, data: {
      "location_id": locationId,
      "reservation_id": reservationId,
    });
    return res['message'];
  }

  Future<String> deleteLocation(int locationId, int reservationId) async {
    dynamic res = await _client.delete(DELETE_LOCATION_FROM_RESERVATION, data: {
      "location_id": locationId,
      "reservation_id": reservationId,
    });
    return res['message'];
  }

  Future<Map<String, dynamic>> checkReservation() async {
    dynamic res = await _client.get(CHECK_RESERVATION);
    if ((res['message'] as String).contains("sucess"))
      return res;
    else
      return null;
  }

  Future<bool> deleteReservation(int id) async {
    String res = (await _client.delete(DELETE_RESERVATION, data: {
      'reseervation_id': id,
    }))["message"];
    if (res.contains('sucess'))
      return true;
    else
      return false;
  }
}
