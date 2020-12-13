class PartieModel {
  final int id, nbJoueurs;
  final String date, nbTrou;
  final bool started;

  PartieModel({
    this.id,
    this.date,
    this.nbJoueurs,
    this.nbTrou,
    this.started,
  });

  factory PartieModel.fromJSON(Map<String, dynamic> json) {
    return PartieModel(
      id: json['id'] as int,
      date: json['date'] as String,
      nbJoueurs: json['nombre_joueurs'] as int,
      nbTrou: json['nombre_trous'] as String,
      started: json['confirmed'] as bool,
    );
  }
}
