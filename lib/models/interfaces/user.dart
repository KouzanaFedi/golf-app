class User {
  String name, email, sexe, telephone, dob, photo;
  int handicap, departId, sacId;
  User({
    this.name,
    this.email,
    this.sexe,
    this.telephone,
    this.dob,
    this.photo,
    this.handicap,
    this.departId,
    this.sacId,
  });

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      email: json["email"],
      sexe: json["sexe"],
      telephone: json["telephone"],
      dob: json["dateDeNaissance"],
      photo: (json["photo"] == null) ? null : json["photo"],
      departId: json["depart_id"],
      sacId: json["sac_id"],
    );
  }
}
