class User {
  String name, email, sexe, telephone, dob, photo, handicap, depart;
  int sacId;
  User({
    this.name,
    this.email,
    this.sexe,
    this.telephone,
    this.dob,
    this.photo,
    this.handicap,
    this.sacId,
  });

  void setDepart(String d) {
    depart = d;
  }

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      email: json["email"],
      sexe: json["sexe"],
      telephone: json["telephone"],
      dob: json["dateDeNaissance"],
      photo: (json["photo"] == null) ? null : json["photo"],
      sacId: json["sac_id"],
      handicap: json["handicap"],
    );
  }
}
