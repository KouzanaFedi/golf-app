class ClubStat {
  final int id, count;
  double _percentage;

  ClubStat({this.id, this.count});

  double get perscentage => _percentage;

  void setPercentage(double p) {
    _percentage = p * 100;
  }

  @override
  String toString() {
    return "id : $id, count : $count, percentage : $_percentage .";
  }

  factory ClubStat.fromJSON(Map<String, dynamic> json) => ClubStat(
        id: json["baton_id"] as int,
        count: json["count"] as int,
      );
}
