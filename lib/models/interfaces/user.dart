import 'package:flutter/material.dart';

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

  Image loadAssetImage() {
    if (this.sexe == "femme")
      return Image.asset("assets/player-f.png");
    else
      return Image.asset("assets/player-m.png");
  }

  void setDepart(String d) {
    depart = d;
  }

  void update(String name, String number, String hcp) {
    if (name != null) {
      this.name = name;
    }
    if (number != null) {
      this.telephone = number;
    }
    if (hcp != null) {
      this.handicap = hcp;
    }
  }

  void updateImage(String image) {
    photo = image;
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
