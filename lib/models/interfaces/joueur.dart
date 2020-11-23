import 'package:flutter/material.dart';

class Joueur {
  final String name, email, dob, gender, handicap, depart, photo;
  Joueur({
    this.depart,
    this.dob,
    this.email,
    this.gender,
    this.handicap,
    this.name,
    this.photo,
  });

  Image loadAssetImage() {
    if (this.gender == "femme")
      return Image.asset("assets/player-f.png");
    else
      return Image.asset("assets/player-m.png");
  }

  factory Joueur.fromJSON(Map<String, dynamic> json) {
    return Joueur(
      depart: json['depart'] as String,
      dob: json['dateDeNaissance'] as String,
      email: json['email'] as String,
      gender: json['sexe'] as String,
      handicap: json['handicap'] as String,
      name: json['name'] as String,
      photo: (json['photo'] != null) ? json['photo'] as String : null,
    );
  }
}
