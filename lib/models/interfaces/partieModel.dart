class PartieModel {
  final int id, nbJoueurs;
  final String date, nbTrou;

  PartieModel({this.id, this.date, this.nbJoueurs, this.nbTrou});

  factory PartieModel.fromJSON(Map<String, dynamic> json) {
    return PartieModel(
      id: json['id'] as int,
      date: json['date'] as String,
      nbJoueurs: json['nombre_joueurs'] as int,
      nbTrou: json['nombre_trous'] as String,
    );
  }
}
