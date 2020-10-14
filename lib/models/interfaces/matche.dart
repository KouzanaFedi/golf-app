class Matche {
  final int id;
  final String name, tarif;

  Matche({this.id, this.name, this.tarif});

  factory Matche.fromJSON(Map<String, dynamic> json) {
    return Matche(
        id: json['id'] as int,
        name: json['nom'] as String,
        tarif: json['tarif'] as String);
  }
}
