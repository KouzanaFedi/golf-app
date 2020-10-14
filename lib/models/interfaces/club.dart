class Club {
  final int id, distance;
  final String nom, marque;

  Club({this.id, this.distance, this.marque, this.nom});

  String get clubHeadAsset => "assets/clubs/${marque.trim().toLowerCase()}.png";
  String get clubLongAsset =>
      "assets/clubs/${marque.trim().toLowerCase()}-l.png";

  factory Club.fromJSON(Map<String, dynamic> data) {
    return Club(
      id: data["id"] as int,
      distance: (data["distance"] != null) ? data["distance"] as int : null,
      marque: data["marque"] as String,
      nom: data["nom"] as String,
    );
  }
}
