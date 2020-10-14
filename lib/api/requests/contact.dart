import 'package:golf_app/api/client.dart';
import 'package:golf_app/api/constants/endPoints.dart';

class Contact {
  static Contact _instance;
  Client _client = Client.getInstance();

  static Contact getInstance() {
    if (_instance == null) _instance = Contact();
    return _instance;
  }

  Future<bool> sendMessage(String name, String email, String msg) {
    return _client
        .post(CONTACT_US_URL, data: {
          'nom': name,
          'email': email,
          'texte': msg,
        })
        .then((value) => true)
        .catchError((onError) => false);
  }
}
