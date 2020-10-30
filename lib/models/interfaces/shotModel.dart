class ShotModel {
  int _clubId, _methodId;
  final int shotNumber;
  bool _penality = false, _sandSave = false, _inHole = false, _send = false;

  ShotModel({this.shotNumber});

  //getters

  int get clubId => _clubId;
  int get methodId => _methodId;
  bool get penality => _penality;
  bool get sandSave => _sandSave;
  bool get send => _send;
  bool get inHole => _inHole;
  bool get canSubmitShot => _clubId != null && _methodId != null;
  bool get canModifyShot => canSubmitShot && _send;
  //setters

  void setClubId(int id) {
    _clubId = id;
  }

  void setMethodId(int id) {
    _methodId = id;
  }

  void setpenality() {
    _penality = !_penality;
  }

  void setSandSave() {
    _sandSave = !_sandSave;
  }

  void setinHole() {
    _inHole = !_inHole;
  }

  void setSend() {
    _send = true;
  }
}
