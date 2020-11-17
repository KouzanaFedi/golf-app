import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPref _instance;
  SharedPreferences _prefs;

  SharedPref(this._prefs);

  static Future<SharedPref> getInstance() async {
    if (_instance == null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _instance = SharedPref(prefs);
    }
    return _instance;
  }

  SharedPreferences get pref => _prefs;

  void storeGameHistory(String toStore) {
    _prefs.setString("gameHistory", toStore);
  }

  String getGameHistory() {
    return _prefs.getString("gameHistory");
  }

  bool gameHistoryExists() {
    return _prefs.containsKey("gameHistory");
  }

  void deleteGameHistory() {
    _prefs.remove("gameHistory");
  }

  void setGameStarted() {
    _prefs.setBool("gameStarted", true);
  }

  bool isGameStartedExists() {
    return _prefs.containsKey("gameStarted");
  }

  void deleteGameStarted() {
    _prefs.remove("gameStarted");
  }
}
