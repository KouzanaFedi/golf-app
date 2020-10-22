import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/map.dart';
import 'package:golf_app/models/providers/trousProvider.dart';
import 'package:provider/provider.dart';

class MapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final trouProvider = Provider.of<TrouProvider>(context);
    return Column(
      key: UniqueKey(),
      children: [
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Map(),
          ),
          height: 400,
          width: 300,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: FlatButton(
            splashColor: Colors.white,
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            onPressed: () {
              trouProvider.set2DView();
            },
            child: Container(
              height: 50,
              width: 220,
              alignment: Alignment.center,
              child: Text(
                "Voir parcours",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
