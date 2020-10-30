class PlayingHole {
  int _mapNumber, _shotNumber;

  int get mapNumber => _mapNumber;
  int get shotNumber => _shotNumber;

  PlayingHole(int map, int shot) {
    _mapNumber = map;
    _shotNumber = shot;
  }

  void nextShot() {
    _shotNumber++;
  }

  void nextMap() {
    _mapNumber++;
  }
}
