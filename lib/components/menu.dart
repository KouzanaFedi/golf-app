import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/menuProvider.dart';
import 'package:provider/provider.dart';

import 'menuOptions/joueurs.dart';
import 'menuOptions/menuOptions.dart';
import 'menuOptions/parcours.dart';
import 'menuOptions/sac.dart';

class Menu extends StatelessWidget {
  final double menuHeight = 400;

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    final double menuWidth = MediaQuery.of(context).size.width * .95;
    return Positioned(
      bottom: menuProvider.currentHeight,
      right: MediaQuery.of(context).size.width * .025,
      child: Stack(
        children: [
          Opacity(
            opacity: !menuProvider.isOpen ? 1 : .8,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: !menuProvider.isOpen ? kElevationToShadow[6] : null,
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              width: menuWidth,
              height: menuHeight,
              alignment: Alignment.topCenter,
              child: GestureDetector(
                child: Icon(
                  !menuProvider.isOpen
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Color(0xFF9AA6AC),
                ),
                onTap: () {
                  menuProvider.closeMenu();
                },
              ),
            ),
          ),
          Container(
            height: menuHeight,
            width: menuWidth,
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Votre partie est prévu pour le mardi 07 septembre à 17h",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MenuOption(
                      title: "Confirmer Sac de Golf",
                      image: "assets/golf_bag_icon.png",
                      child: Sac(),
                    ),
                    MenuOption(
                      title: "Liste des parcours",
                      image: "assets/hole_icon1.png",
                      child: Parcours(),
                    )
                  ],
                ),
                MenuOption(
                  title: "Liste des joueurs",
                  image: "assets/player.png",
                  child: Joueurs(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
