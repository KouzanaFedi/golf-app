import 'package:flutter/material.dart';
import 'package:golf_app/models/interfaces/news.dart';
import 'package:golf_app/api/constants/endPoints.dart';

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
            horizontal: 5,
          ),
          child: Text(
            news.title,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ),
        Image.network(
          NEWS_IMAGE + news.image,
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
        Divider(
          endIndent: 35,
          thickness: 2,
          indent: 35,
        ),
      ],
    );
  }
}
