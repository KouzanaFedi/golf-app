import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/parcours.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:golf_app/views/options.dart';
import 'package:provider/provider.dart';

class General extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 50, bottom: 20),
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Text(
            "Bonjour ${(userProvider.user == null) ? '...' : userProvider.user.name.split(' ')[0]}",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            "Il est très important que vous appreniez différents types de coups pour chaque situation. Mais il est également important que vous choisissiez un trait spécifique et que vous le perfectionniez jusqu’à ce qu’il devienne votre signature.",
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, bottom: 20),
          child: FlatButton(
            splashColor: Colors.white,
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(Options.route(Parcours(), "Liste des parcours"));
            },
            child: Container(
              height: 50,
              width: 160,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Image.asset(
                      "assets/hole_icon.png",
                      scale: 1.25,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Voir parcours",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
