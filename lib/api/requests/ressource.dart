import 'package:golf_app/api/client.dart';
import 'package:golf_app/models/interfaces/club.dart';
import 'package:golf_app/api/constants/endPoints.dart';

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
}
