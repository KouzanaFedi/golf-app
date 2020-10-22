class News {
  final String title, content, image;
  News({this.content, this.image, this.title});

  factory News.fromJSON(Map<String, dynamic> json) {
    return News(
      title: json["titre"] as String,
      content: json["texte"] as String,
      image: json["photo"] as String,
    );
  }
}
