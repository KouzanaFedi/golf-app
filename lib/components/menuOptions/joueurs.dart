import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/player_bar.dart';

class Joueurs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: 10,
        itemBuilder: (context, index) => PlayerBar(),
      ),
    );
  }
}
