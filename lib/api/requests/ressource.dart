import 'package:dio/dio.dart';
import 'package:golf_app/api/client.dart';
import 'package:golf_app/models/interfaces/club.dart';
import 'package:golf_app/api/constants/endPoints.dart';
import 'package:golf_app/models/interfaces/methodJeu.dart';
import 'package:golf_app/models/interfaces/news.dart';
import 'package:golf_app/models/interfaces/trouModel.dart';
import 'package:golf_app/models/interfaces/weatherModel.dart';

class Ressource {
  static Ressource _instance;
  Client _client = Client.getInstance();

  static Ressource getInstance() {
    if (_instance == null) _instance = Ressource();
    return _instance;
  }

  Future<List<Club>> fetchAvailableClubs() async {
    List<Club> listOfClubs = [];
    List<dynamic> clubs = (await _client.get(AVAILABLE_CLUBS_URL))["data"];
    if (clubs.length > 0) {
      for (var club in clubs) {
        listOfClubs.add(Club.fromJSON(club));
      }
    }
    return listOfClubs;
  }

  Future<List<Club>> fetchConetnuSac() async {
    List<Club> listOfClubs = [];
    List<dynamic> clubs = (await _client.get(CONTENU_SAC))["batons"];
    if (clubs.length > 0) {
      clubs.removeLast();
      for (var club in clubs) {
        listOfClubs.add(Club.fromJSON(club[0]));
      }
    }
    return listOfClubs;
  }

  Future<bool> updateContenuSac(List<int> clubs) async {
    final Map<String, int> _data = {};
    String key = "baton_id";
    for (var i = 0; i < 14; i++) {
      if (i < clubs.length) {
        _data["$key${i + 1}"] = clubs[i];
      } else
        _data["$key${i + 1}"] = 0;
    }
    String res = (await _client.delete(UPDATE_SAC, data: _data))["message"];
    return res.contains('sucess');
  }

  Future<List<TrouModel>> fetchHoles() async {
    List<TrouModel> list = [];
    List<dynamic> data = await _client.get(MAPS_URL);

    if (data.length > 0) {
      for (var item in data) {
        list.add(TrouModel.fromJSON(item));
      }
    }
    return list;
  }

  Future<List<News>> fetchNews() async {
    List<News> list = [];
    List<dynamic> data = (await _client.get(NEWS_URL))["data"];

    if (data.length > 0) {
      for (var item in data) {
        list.add(News.fromJSON(item));
      }
    }
    return list;
  }

  Future<List<MethodJeu>> fetchMethods() async {
    List<MethodJeu> list = [];
    List<dynamic> data = (await _client.get(METHODS_LIST))["data"];

    if (data.length > 0) {
      for (var item in data) {
        list.add(MethodJeu.fromJSON(item));
      }
    }
    return list;
  }

  Future<WeatherModerl> fetchWeather() async {
    var data = (await Dio().get(WEATHER)).data;

    return WeatherModerl.fromJSON(data["current"]);
  }
}
