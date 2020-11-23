import 'package:flutter/material.dart';
import 'package:golf_app/components/partie/generalScore/playerIcon.dart';

class LabelRow extends StatelessWidget {
  final List<Map<String, String>> playersData;
  LabelRow({this.playersData});
  List<Widget> generatePlayers() {
    List<Widget> list = [];
    playersData.forEach((element) {
      list.add(PlayerIcon(
          name: element["name"],
          image: element["image"],
          sexe: element["sexe"]));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Flexible(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 25),
            child: Text(
              "Trou",
              style: TextStyle(
                fontSize: 16,
                color: theme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ...generatePlayers(),
        ],
      ),
    );
  }
}
