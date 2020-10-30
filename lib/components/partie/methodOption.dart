import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:provider/provider.dart';

class MethodOption extends StatelessWidget {
  final String name;
  final int id;
  MethodOption({this.name, this.id});

  @override
  Widget build(BuildContext context) {
    final partieProvider = Provider.of<PartieProvider>(context);
    int holeNb = partieProvider.currentHole;
    int shotNb = partieProvider.currentShot;
    final shot = partieProvider.holePlayed[holeNb].shots[shotNb];
    final bool selected = shot.methodId == id;
    return FlatButton(
      color: (selected) ? Colors.grey : Colors.white,
      splashColor: (selected) ? Colors.white : Colors.grey,
      padding: EdgeInsets.symmetric(vertical: 2.5),
      onPressed: () {
        partieProvider.setMethod(id);
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 5, right: 5, left: 38),
        height: 35,
        alignment: Alignment.centerLeft,
        child: Text(
          name,
          style: TextStyle(color: (selected) ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
