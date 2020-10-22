import 'package:flutter/material.dart';
import 'package:golf_app/models/interfaces/news.dart';

class NewsCard extends StatelessWidget {
  final News news;
  NewsCard({this.news});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Text(
            news.title,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Image.network(
          "http://club-house-api.herokuapp.com/uploads/actualite/${news.image}",
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          margin: EdgeInsets.only(top: 10),
          child: Text(
            news.content,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
