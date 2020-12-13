import 'package:golf_app/api/client.dart';
import 'package:golf_app/api/constants/endPoints.dart';
import 'package:golf_app/models/interfaces/joueur.dart';
import 'package:golf_app/models/interfaces/partieModel.dart';
import 'package:golf_app/models/interfaces/playerScoreProfile.dart';
import 'package:golf_app/models/interfaces/scoreGeneralModel.dart';

class Partie {
  static Partie _instance;
  Client _client = Client.getInstance();

  static Partie getInstance() {
    if (_instance == null) _instance = Partie();
    return _instance;
  }

  Future<PartieModel> getPartie() async {
    PartieModel partieModel;
    dynamic json = await _client.get(VOIR_PARTIE);
    String res = json['message'];

    if (res.contains("existant")) {
      partieModel = PartieModel.fromJSON(json['data'][0]);
    } else
      partieModel = null;

    return partieModel;
  }

  Future<List<Joueur>> getJoueurs(int partieId) async {
    List<Joueur> list = [];

    List<dynamic> data = (await _client.get(
      VOIR_JOUEURS,
      queryParameters: {"partie_id": partieId},
    ))['data'];
    if (data.length > 0) {
      for (var item in data) {
        list.add(Joueur.fromJSON(item));
      }
    }
    return list;
  }

  Future<List<ScoreGeneralModel>> fetchGeneralScore(int partieId) async {
    List<ScoreGeneralModel> list = [];
    List<dynamic> data = (await _client.get(
      GENERAL_SCORE,
      queryParameters: {"partie_id": partieId},
    ))["data"];
    if (data.isNotEmpty) {
      data.forEach((element) {
        list.add(ScoreGeneralModel.fromJSON(element));
      });
    }
    return list;
  }

  Future<int> initScoreHole(int partieId, int holeId) async {
    var data = await _client.post(PLAY_HOLE, data: {
      'partie_id': partieId,
      'trou_id': holeId,
    });
    return data['score_id'];
  }

  Future<int> playShot(int clubId, int methodId, int scoreId, bool inHole,
      bool penality, bool sandSave) async {
    int _inhole = inHole ? 1 : 0;
    return (await _client.post(PLAY_SHOT, data: {
      "score_id": scoreId,
      "baton_id": clubId,
      "methode_id": methodId,
      "balle_marque": _inhole,
      "penalties": penality,
      "sandSave": sandSave,
    }))["data"]["id"];
  }

  Future<List<PlayerScoreProfile>> fetchPlayersHoleScore(int scoreId) async {
    List<PlayerScoreProfile> list = [];
    List<dynamic> data = (await _client
        .get(HOLE_SCORE, queryParameters: {"score_id": scoreId}))["data"];
    if (data.isNotEmpty) {
      data.forEach((element) {
        PlayerScoreProfile psp = PlayerScoreProfile.fromJSON(element[0]);
        if (psp.type != null) {
          list.add(psp);
        }
      });
      list.sort((c, n) => c.score.compareTo(n.score));
    }
    return list;
  }

  Future computePartieStats(int partieId) async {
    await _client.put(COMPUTE_PARTIE_STATS, data: {"partie_id": partieId});
  }

  Future<bool> canStartGame(int partieId) async {
    String data = (await _client.post(START_PARTIE,
        queryParameters: {"partie_id": partieId}))["message"];
    return !data.contains("attente");
  }
}
