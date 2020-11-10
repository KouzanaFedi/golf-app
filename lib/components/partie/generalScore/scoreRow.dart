import 'package:flutter/material.dart';

class ScoreRow extends StatelessWidget {
  final bool firstHalf;
  final List<List<int>> scores;
  ScoreRow({this.firstHalf, this.scores});

  List<Widget> trouNb(ThemeData theme) {
    int start = firstHalf ? 0 : 9;
    List<Widget> list = [];
    for (var i = start + 0; i < start + 9; i++) {
      list.add(Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          (i + 1).toString(),
          style: TextStyle(
            color: theme.primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ));
    }
    return list;
  }

  List<Widget> scoreTrou(List<int> score) {
    List<Widget> list = [];
    for (var i = 0; i < 9; i++) {
      list.add(Container(
        height: 35,
        width: 20,
        alignment: Alignment.center,
        child: Text(
          (score[i] == 0) ? '-' : score[i].toString(),
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF9AA6AC),
          ),
        ),
      ));
    }
    return list;
  }

  List<Widget> generateScores() {
    List<Widget> list = [];
    scores.forEach((element) {
      list.add(
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [...scoreTrou(element)],
          ),
        ),
      );
    });

    return list;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Flexible(
      flex: 7,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [...trouNb(theme)],
            ),
          ),
          ...generateScores()
        ],
      ),
    );
  }
}
