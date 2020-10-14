import 'package:dio/dio.dart';
import 'package:golf_app/api/client.dart';
import 'package:golf_app/api/constants/endPoints.dart';
import 'package:golf_app/models/interfaces/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  static Auth _instance;
  final SharedPreferences _pref;
  String _userToken;

  String get token => _userToken;

  static Future<Auth> getInstance() async {
    if (_instance == null) {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _instance = Auth(_prefs);
    }

    return _instance;
  }

  Auth(this._pref) {
    this._userToken = _pref.getString("token");
  }

  bool isAuth() {
    return _userToken != null;
  }

  Future<void> persistAuth(String token) async {
    await _pref.setString("token", token);
  }

  Future<User> logInUser(String email, String password) async {
    User usr;
    try {
      Map<String, dynamic> json = await Client.getInstance()
          .post(LOGIN_URL, data: {"email": email, "password": password});

      _userToken = json["token"];
      await persistAuth(_userToken);

      Client.getInstance().setToken(_userToken);
      usr = await getUser();

      return usr;
    } catch (e) {
      return usr;
    }
  }

  Future<int> registerUser(String nom, String password, String email,
      String gender, String number, String dob) async {
    return await Client.getInstance()
        .post(REGISTER_URL, data: {
          "name": nom,
          "password": password,
          "email": email,
          "sexe": gender,
          "telephone": number,
          "dateDeNaissance": dob
        })
        .then((value) => 0)
        .catchError((onError) {
          if (onError.toString().contains("302")) {
            return 1;
          }
          return -1;
        });
  }

  Future<User> getUser() async {
    if (isAuth()) {
      Map<String, dynamic> json = await Client.getInstance().get(
        GETUSER_URL,
        options: Options(
          headers: {"authorization": "Bearer $_userToken"},
        ),
      );
      return User.fromJSON(json);
    } else
      return null;
  }

  Future<int> logOutUser() async {
    Client client = Client.getInstance();
    try {
      await client.post(LOGOUT_URL,
          options: Options(
            headers: {"authorization": "Bearer $_userToken"},
          ));

      await _pref.remove("token");
      _userToken = null;
      _instance = null;
      client.setToken(null);
      return 0;
    } catch (e) {
      return -1;
    }
  }
}
