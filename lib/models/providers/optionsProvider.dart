import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/ressource.dart';

class OptionsProvider with ChangeNotifier {
  bool _editing = false;
  String newName;
  String nameError;
  bool loading = false;

  String newNumber;
  String numberError;

  OptionsProvider();

  bool get editing => _editing;
  String _obliField() => "Champ obligatoir.";
  String _miniChar(int x) => "Minimun $x chiffres.";

  void setName(String value) {
    if (value.isEmpty) {
      nameError = _obliField();
    } else if (value.length < 3) {
      nameError = _miniChar(3);
    } else {
      newName = value;
      nameError = null;
    }
    notifyListeners();
  }

  void setLoading() {
    if (!loading) {
      loading = true;
      notifyListeners();
    }
  }

  void unSetLoading() {
    if (loading) {
      loading = false;
      notifyListeners();
    }
  }

  void setNumber(String value) {
    if (value.isEmpty) {
      numberError = _obliField();
    } else if (value.length < 8) {
      numberError = _miniChar(8);
    } else {
      newNumber = value;
      numberError = null;
    }
    notifyListeners();
  }

  void setEditing() {
    if (!_editing) {
      _editing = true;
      notifyListeners();
    }
  }

  void unSetEditing() {
    if (_editing) {
      _editing = false;
      notifyListeners();
    }
  }

  Future updateInfo() async {
    await Ressource.getInstance().updateInfor(newName, newNumber);
  }
}
