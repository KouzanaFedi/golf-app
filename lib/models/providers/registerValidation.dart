import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/auth.dart';
import 'package:golf_app/models/interfaces/validationItem.dart';

class RegisterValidation with ChangeNotifier {
  ValidationItem _prenom = ValidationItem(null, null);
  ValidationItem _nom = ValidationItem(null, null);
  ValidationItem _gender = ValidationItem("homme", null);
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);
  ValidationItem _dob = ValidationItem(null, null);
  ValidationItem _number = ValidationItem(null, null);
  bool _registred = false;

  //errors

  String _obliField() => "Champ obligatoir.";
  String _miniChar(int x) => "Minimun $x caractères.";
  String _invalidFormat() => "Format invalide.";

  //getters

  ValidationItem get prenom => _prenom;
  ValidationItem get nom => _nom;
  ValidationItem get email => _email;
  ValidationItem get password => _password;
  ValidationItem get dob => _dob;
  ValidationItem get gender => _gender;
  ValidationItem get number => _number;

  bool get registred => _registred;

  bool get canRegister => (_prenom.value != null &&
          _nom.value != null &&
          _email.value != null &&
          _password.value != null &&
          _dob.value != null &&
          _number.value != null)
      ? true
      : null;

  //setters

  void setRegistred() {
    _registred = true;
    notifyListeners();
  }

  void setPrenom(String value) {
    if (value.isEmpty) {
      _prenom = ValidationItem(null, _obliField());
    } else if (value.length < 3) {
      _prenom = ValidationItem(null, _miniChar(3));
    } else
      _prenom = ValidationItem(value, null);
    notifyListeners();
  }

  void setNom(String value) {
    if (value.isEmpty) {
      _nom = ValidationItem(null, _obliField());
    } else if (value.length < 3) {
      _nom = ValidationItem(null, _miniChar(3));
    } else
      _nom = ValidationItem(value, null);
    notifyListeners();
  }

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

  void setDOB(int year, int month, int day) {
    String value =
        "$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}";

    try {
      DateTime.parse(value);
      _dob = ValidationItem(value, null);
    } catch (e) {
      _dob = ValidationItem(null, _obliField());
    }
    notifyListeners();
  }

  void setGender(String g) {
    _gender = ValidationItem(g, null);
    notifyListeners();
  }

  void setNumber(String value) {
    try {
      int.parse(value);
      if (value[0] == '0') {
        _number = ValidationItem(null, _invalidFormat());
      } else if (value.length < 8) {
        _number = ValidationItem(null, _miniChar(8));
      } else
        _number = ValidationItem(value, null);
    } catch (e) {
      _number = ValidationItem(null, _invalidFormat());
    }
    notifyListeners();
  }

  String upperCaseFirstLetter(String s) {
    return s[0].toUpperCase() + s.substring(1);
  }

  Future<int> registerUser() {
    String nom =
        "${upperCaseFirstLetter(_prenom.value)} ${upperCaseFirstLetter(_nom.value)}";
    return Auth.getInstance().then((value) => value.registerUser(
        nom,
        _password.value,
        _email.value,
        _gender.value,
        _number.value,
        _dob.value));
  }
}
