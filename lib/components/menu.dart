import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/menuProvider.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:golf_app/views/interScreen2.dart';
import 'package:provider/provider.dart';

import 'menuOptions/joueurs.dart';
import 'menuOptions/menuOptions.dart';
import 'menuOptions/parcours.dart';
import 'menuOptions/sac.dart';

class Menu extends StatelessWidget {
  final double menuHeight = 460;
  String getDay(int d) {
    List<String> days = [
      "Lundi",
      "Mardi",
      "Mercredi",
      "Jeudi",
      "Vendredi",
      "Samedi",
      "Dimanche"
    ];
    return days[d - 1];
  }

  String getMonth(int d) {
    List<String> months = [
      "jan",
      "fév",
      "mar",
      "avr",
      "mai",
      "jui",
      "jui",
      "aoû",
      "sep",
      "oct",
      "nov",
      "déc"
    ];
    return months[d - 1];
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    final double menuWidth = MediaQuery.of(context).size.width * .95;
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final DateTime matchDate = DateTime.parse(userProvider.partieModel.date);
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
                    "Votre partie est prévu pour le ${getDay(matchDate.weekday)} ${matchDate.day} ${getMonth(matchDate.month)} ${matchDate.year} à ${matchDate.hour}h${matchDate.minute.toString().padLeft(2, "0")}",
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
                      title: "Modifier Sac de Golf",
                      image: "assets/golf_bag_icon.png",
                      child: Sac(),
                    ),
                    MenuOption(
                      title: "Le parcours",
                      image: "assets/hole_icon1.png",
                      child: Parcours(
                        nbTrou: int.parse(userProvider.partieModel.nbTrou),
                      ),
                    )
                  ],
                ),
                MenuOption(
                  title: "Liste des joueurs",
                  image: "assets/player.png",
                  child: Joueurs(),
                ),
                FlatButton(
                  splashColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        InterScreen2.route(userProvider.partieModel.id));
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Lancer Partie",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
