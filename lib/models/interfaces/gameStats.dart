class GameStats {
  final int partieId, handicap;
  final double birdie, par, holeInOne, bogey, albatros, trippleBogey, eagle;

  GameStats({
    this.albatros,
    this.birdie,
    this.bogey,
    this.eagle,
    this.handicap,
    this.holeInOne,
    this.par,
    this.partieId,
    this.trippleBogey,
  });

  @override
  String toString() {
    return "albatros : $albatros, birdie : $birdie, bogey : $bogey, eagle : $eagle, handicap : $handicap, holeInOne : $holeInOne, partieId : $partieId, trippleBogey : $trippleBogey .";
  }

  factory GameStats.fromJSON(Map<String, dynamic> json) => GameStats(
        albatros: double.parse(
            double.parse(json["albatros_pourcentage"]).toStringAsFixed(2)),
        birdie: double.parse(
            double.parse(json["birdie_pourcentage"]).toStringAsFixed(2)),
        bogey: double.parse(
            double.parse(json["Bogey_pourcentage"]).toStringAsFixed(2)),
        eagle: double.parse(
            double.parse(json["Eagle_pourcentage"]).toStringAsFixed(2)),
        handicap: json["handicap"] as int,
        holeInOne: double.parse(
            double.parse(json["holeInOne_pourcentage"]).toStringAsFixed(2)),
        par: double.parse(
            double.parse(json["par_pourcentage"]).toStringAsFixed(2)),
        partieId: json["partie_id"] as int,
        trippleBogey: double.parse(
            double.parse(json["TrippleBogey_pourcentage"]).toStringAsFixed(2)),
      );
}
