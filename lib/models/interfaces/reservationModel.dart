class ReservationModel {
  final int id, userId, matcheId;
  final String matcheDate;

  ReservationModel({this.id, this.matcheId, this.matcheDate, this.userId});

  factory ReservationModel.fromJSON(Map<String, dynamic> json) {
    return ReservationModel(
      id: json["id"] as int,
      matcheDate: json["date_matche"] as String,
      matcheId: json["match_id"] as int,
      userId: json["user_id"] as int,
    );
  }
}
