import 'package:golf_app/api/client.dart';
import 'package:golf_app/api/constants/endPoints.dart';
import 'package:golf_app/models/interfaces/joueur.dart';
import 'package:golf_app/models/interfaces/partieModel.dart';

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
      partieModel = PartieModel.fromJSON(json['data']);
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
}
