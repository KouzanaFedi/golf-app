import 'package:flutter/material.dart';
import 'package:golf_app/models/interfaces/user.dart';

class UserProvider with ChangeNotifier {
  User _user;

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
