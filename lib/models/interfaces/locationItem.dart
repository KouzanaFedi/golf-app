class LocationItem {
  final int id;
  final String name, tarif;

  LocationItem({this.id, this.name, this.tarif});

  factory LocationItem.fromJSON(Map<String, dynamic> json) {
    return LocationItem(
      id: json['id'] as int,
      tarif: json['tarif'] as String,
      name: json['nom'] as String,
    );
  }
}
