class ScoreGeneralModel {
  final String name, image;
  final List<int> score;

  ScoreGeneralModel({this.image, this.name, this.score});

  factory ScoreGeneralModel.fromJSON(Map<String, dynamic> data) {
    Map<String, dynamic> scoreMap = data["score"];
    List<int> scoreList = [];
    scoreMap.forEach((key, value) {
      scoreList.add(value);
    });
    return ScoreGeneralModel(
      name: data["nom"] as String,
      image: (data['photo'] != null) ? data['photo'] as String : null,
      score: scoreList,
    );
  }
}
