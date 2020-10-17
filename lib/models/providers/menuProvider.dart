import 'package:flutter/material.dart';

class MenuProvider with ChangeNotifier {
  double _openHeight = 0;
  double _closedHeight = -350;

  double _currentHeight;
  int _currentTab = 1;

  MenuProvider() {
    _currentHeight = _closedHeight;
  }

  //getters
  double get currentHeight => _currentHeight;
  bool get isOpen => (_currentHeight == _openHeight);
  int get currentTab => _currentTab;
  bool get currentTabIsHome => _currentTab == 0;
  bool get currentTabIsReservation => _currentTab == 1;
  bool get currentTabIsProfile => _currentTab == 2;
  bool get currentTabIsSettings => _currentTab == 3;

  void closeMenu() {
    if (isOpen) {
      _currentHeight = _closedHeight;
    }
    notifyListeners();
  }

  void openMenu() {
    if (!isOpen) {
      _currentHeight = _openHeight;
    }
    notifyListeners();
  }

  void goToHomeTab() {
    if (_currentTab != 0) {
      _currentTab = 0;
      notifyListeners();
    }
  }

  void goToReservationTab() {
    if (_currentTab != 1) {
      _currentTab = 1;
      notifyListeners();
    }
  }

  void goToProfileTab() {
    if (_currentTab != 2) {
      _currentTab = 2;
      notifyListeners();
    }
  }

  void goToSettingsTab() {
    if (_currentTab != 3) {
      _currentTab = 3;
      notifyListeners();
    }
  }
}
