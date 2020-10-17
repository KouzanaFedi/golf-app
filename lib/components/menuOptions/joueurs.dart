import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/player_bar.dart';
import 'package:golf_app/models/interfaces/joueur.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:provider/provider.dart';

class Joueurs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    List<Joueur> listOfJoueurs = userProvider.listJoueur;
    return Expanded(
      child: (listOfJoueurs.length > 0)
          ? ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: listOfJoueurs.length,
              itemBuilder: (context, index) =>
                  PlayerBar(joueur: listOfJoueurs[index]),
            )
          : Center(
              child: Text(
                "Pas de joueurs.",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
