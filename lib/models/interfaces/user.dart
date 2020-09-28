class User {
  String name, email, sexe, telephone, dob;
  User({this.name, this.email, this.sexe, this.telephone, this.dob});

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      email: json["email"],
      sexe: json["sexe"],
      telephone: json["telephone"],
      dob: json["dateDeNaissance"],
    );
  }
}
