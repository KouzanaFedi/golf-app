class Hole {
  final int order;
  double longitude, latitude;

  Hole({this.order, this.longitude, this.latitude});

  factory Hole.fromJSON(Map<String, dynamic> data) {
    return Hole(
      order: data["order"] as int,
      longitude: data["longitude"] as double,
      latitude: data["latitude"] as double,
    );
  }
}
