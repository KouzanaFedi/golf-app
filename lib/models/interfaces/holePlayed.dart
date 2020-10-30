import 'package:golf_app/models/interfaces/shotModel.dart';

class HolePlayed {
  List<ShotModel> _shots = [
    ShotModel(shotNumber: 1),
  ];
  bool _finished = false;
  final int holeIndex;

  HolePlayed({this.holeIndex});

//getters
  List<ShotModel> get shots => _shots;
  bool get finished => _finished;

//setters
  void addShot() {
    _shots.add(ShotModel());
  }
}
