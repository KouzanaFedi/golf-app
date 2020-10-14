import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/contact.dart';
import 'package:golf_app/models/interfaces/validationItem.dart';

class ContactValidation with ChangeNotifier {
  ValidationItem _nom = ValidationItem(null, null);
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _msg = ValidationItem(null, null);
  bool _isSend = false;

  //errors

  String _obliField() => "Champ obligatoir.";
  String _invalidFormat() => "Format invalide.";
  String _miniChar(int x) => "Minimun $x charactéres.";

  //getters

  ValidationItem get nom => _nom;
  ValidationItem get email => _email;
  ValidationItem get msg => _msg;
  bool get isSend => _isSend;

  bool get canSubmit =>
      (_nom.value != null && _email.value != null && _msg.value != null)
          ? true
          : false;

  //setters

  void initForm() {
    _nom = ValidationItem(null, null);
    _email = ValidationItem(null, null);
    _msg = ValidationItem(null, null);
    notifyListeners();
  }

  void setIsSend() {
    if (_isSend == false) _isSend = true;
    notifyListeners();
  }

  void setIsNotSend() {
    if (_isSend == true) _isSend = false;
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

  void setMsg(String msg) {
    if (msg.isEmpty)
      _msg = ValidationItem(null, _obliField());
    else if (msg.length < 10)
      _msg = ValidationItem(null, _miniChar(10));
    else
      _msg = ValidationItem(msg, null);
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

  String upperCaseFirstLetter(String s) {
    return s[0].toUpperCase() + s.substring(1);
  }

  Future<bool> submitContact() {
    List<String> itemsName = _nom.value.split(' ');
    for (var item in itemsName) {
      item = upperCaseFirstLetter(item);
    }
    String name = itemsName.join(' ');
    return Contact.getInstance().sendMessage(name, _email.value, _msg.value);
  }
}
