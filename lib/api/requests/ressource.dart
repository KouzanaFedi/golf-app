import 'package:dio/dio.dart';
import 'package:golf_app/api/client.dart';
import 'package:golf_app/models/interfaces/club.dart';
import 'package:golf_app/api/constants/endPoints.dart';
import 'package:golf_app/models/interfaces/clubStat.dart';
import 'package:golf_app/models/interfaces/gameStats.dart';
import 'package:golf_app/models/interfaces/methodJeu.dart';
import 'package:golf_app/models/interfaces/news.dart';
import 'package:golf_app/models/interfaces/statistics.dart';
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
    return WeatherModerl.fromJSON((await Dio().get(WEATHER)).data["current"]);
  }

  Future<Statistics> fetchStats() async {
    print("sending fetch stats req...");
    var data = (await _client.get(GENERAL_STATS));
    print(data);
    return Statistics.fromJSON(data);
  }

  Future<List<GameStats>> fetchGameStats() async {
    print("sending fetch game stats req...");

    List<GameStats> list = [];
    List<dynamic> data = (await _client.get(GAMES_STATS))["data"];
    print(data);

    if (data.isNotEmpty) {
      for (var item in data) {
        list.add(GameStats.fromJSON(item));
      }
      while (list.length > 6) {
        list.removeLast();
      }
    }

    return list;
  }

  Future<List<ClubStat>> fetchClubStats() async {
    print("sending fetch club stats req...");
    List<ClubStat> list = [];
    Map<String, dynamic> data = await _client.get(CLUBS_STAT);
    print(data);
    int nbFrap = data["nombre frappes"];
    List<dynamic> listData = data["data"];

    if (listData.isNotEmpty) {
      for (var item in listData) {
        ClubStat clubStat = ClubStat.fromJSON(item);
        clubStat.setPercentage(
            double.parse((clubStat.count / nbFrap).toStringAsFixed(2)));
        list.add(clubStat);
      }
      list.sort((c, n) => c.count.compareTo(n.count));
      while (list.length > 3) {
        list.removeLast();
      }
    }
    return list;
  }
}
