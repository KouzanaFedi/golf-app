class PartieModel {
  final int id, nbJoueurs;
  final String date;

  PartieModel({this.id, this.date, this.nbJoueurs});

  factory PartieModel.fromJSON(Map<String, dynamic> json) {
    return PartieModel(
      id: json['id'] as int,
      date: json['date'] as String,
      nbJoueurs: json['nombre_joueurs'] as int,
    );
  }
}
