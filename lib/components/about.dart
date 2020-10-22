import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle titleStyle = TextStyle(
      color: theme.primaryColor,
      fontSize: 17,
    );
    double paddingBetweenItems = 15;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: paddingBetweenItems),
            child: Text("A propos", style: titleStyle),
          ),
          Text(
            "Équipé d'un parcours de golf qui s’étend sur 80 Ha et comporte 18 trous (par 72) représentant une distance totale de 6300 m. Le Club House luxueusement équipé avec vestiaires hommes et dames, Salon, Bar-Restaurant pour les repas entre amis, Pro-Shop, Matériel en location; des trolleys,  des voitures électriques et des sacs de golf, Un terrain d'entraînement avec practice, putting-green, pitching green…",
            style: TextStyle(
              color: theme.textSelectionColor,
              fontSize: 12,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: paddingBetweenItems, bottom: paddingBetweenItems),
            child: Text("Services", style: titleStyle),
          ),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ServiceIcon(
                    title: "Terrain d'entraînement",
                    imagePath: "assets/9_trous.png"),
                ServiceIcon(
                    title: "18 trous \n 72 Par",
                    imagePath: "assets/18_trous.png"),
                ServiceIcon(
                    title: "Golf \n Proshop",
                    imagePath: "assets/voiturette.png"),
                ServiceIcon(
                    title: "Restaurant \n Bar",
                    imagePath: "assets/restaurant.png")
              ]),
        ],
      ),
    );
  }
}

class ServiceIcon extends StatelessWidget {
  final String title, imagePath;
  ServiceIcon({@required this.title, @required this.imagePath});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double wh = 50;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5),
              width: wh,
              height: wh,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.textSelectionColor,
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Image.asset(
                imagePath,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 75,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: theme.textSelectionColor,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }
}
