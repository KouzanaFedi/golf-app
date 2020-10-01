import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/auth.dart';
import 'package:golf_app/models/interfaces/user.dart';
import 'package:golf_app/models/interfaces/validationItem.dart';

class LogInValidation with ChangeNotifier {
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);

  //errors

  String _obliField() => "Champ obligatoir.";
  String _miniChar(int x) => "Minimun $x charactéres.";
  String _invalidFormat() => "Format invalide.";

  //getters

  ValidationItem get email => _email;
  ValidationItem get password => _password;

  bool get canLogIn {
    if (_email.value != null && _password.value != null)
      return true;
    else
      return false;
  }

  //setters

  void setEmail(String value) {
    RegExp exp = new RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (value.isEmpty) {
      _email = ValidationItem(null, _obliField());
    } else if (!exp.hasMatch(value)) {
      _email = ValidationItem(null, _invalidFormat());
    } else
      _email = ValidationItem(value, null);
    notifyListeners();
  }

  void setPassword(String value) {
    if (value.isEmpty) {
      _password = ValidationItem(null, _obliField());
    } else if (value.length < 8) {
      _password = ValidationItem(null, _miniChar(8));
    } else
      _password = ValidationItem(value, null);
    notifyListeners();
  }

  Future<User> logInUser() async {
    return Auth.getInstance()
        .then((value) => value.logInUser(_email.value, _password.value));
  }
}
