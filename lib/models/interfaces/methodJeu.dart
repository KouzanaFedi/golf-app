class MethodJeu {
  final int id;
  final String name;
  MethodJeu({this.id, this.name});

  factory MethodJeu.fromJSON(Map<String, dynamic> data) {
    return MethodJeu(
      id: data["id"] as int,
      name: data["nom"] as String,
    );
  }
}
