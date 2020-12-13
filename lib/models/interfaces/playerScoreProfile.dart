class PlayerScoreProfile {
  final String name, type, image, gender;
  final int score;

  PlayerScoreProfile(
      {this.image, this.name, this.score, this.type, this.gender});

  factory PlayerScoreProfile.fromJSON(Map<String, dynamic> json) {
    return PlayerScoreProfile(
      name: json['nom'] as String,
      type: json['type'] as String,
      score: json['valeur'] as int,
      gender: json['sexe'] as String,
      image: (json['photo'] != null) ? json['photo'] as String : null,
    );
  }
}
