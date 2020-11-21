class TrouModel {
  final int number, dtWhite, dtYellow, dtRed, dtBlue, par, strokeIndex, parGir;
  final String image2D;
  double _lat, _long, _sTop, _sLeft, _fTop, _fLeft;

  TrouModel({
    this.dtBlue,
    this.dtRed,
    this.dtWhite,
    this.dtYellow,
    this.image2D,
    this.number,
    this.par,
    this.parGir,
    this.strokeIndex,
  });

  double get latitude => _lat;
  double get longitude => _long;
  double get sTop => _sTop;
  double get sLeft => _sLeft;
  double get fTop => _fTop;
  double get fLeft => _fLeft;
  String get smallImage => image2D.split(".").join('-s.');

  void setLatLong(double lat, double long) {
    _lat = lat;
    _long = long;
  }

  void setFlagsPos(double top, double left) {
    _fTop = top;
    _fLeft = left;
  }

  void setStatsPos(double top, double left) {
    _sTop = top;
    _sLeft = left;
  }

  factory TrouModel.fromJSON(Map<String, dynamic> json) {
    return TrouModel(
      number: json["numero"] as int,
      image2D: json["image2D"] as String,
      dtBlue: json["distance_trou_bleu"] as int,
      dtRed: json["distance_trou_rouge"] as int,
      dtWhite: json["distance_trou_blanc"] as int,
      dtYellow: json["distance_trou_jaune"] as int,
      par: json["par"] as int,
      parGir: json["par_gir"] as int,
      strokeIndex: json["strokeIndex"] as int,
    );
  }
}
