import 'package:flutter/material.dart';
import 'package:golf_app/components/partie/methodOption.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:provider/provider.dart';

class MethodsChoice extends StatelessWidget {
  Widget chosenMethod(String name) => Padding(
        padding: EdgeInsets.only(bottom: 5, left: 15),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 2.5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 70),
                child: Text(
                  name,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    final partieProvider = Provider.of<PartieProvider>(context);
    int holeNb = partieProvider.currentHole;
    int shotNb = partieProvider.currentShot;
    final shot = partieProvider.holePlayed[holeNb].shots[shotNb];
    ThemeData _expansionTileTheme = Theme.of(context).copyWith(
      dividerColor: Colors.transparent,
    );
    List<Widget> list = [];
    for (var item in partieProvider.methods) {
      list.add(MethodOption(
        name: item.name,
        id: item.id,
      ));
    }

    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Theme(
        data: _expansionTileTheme,
        child: ExpansionTile(
          tilePadding: EdgeInsets.only(right: 16),
          childrenPadding: EdgeInsets.only(top: 5),
          title: shot.methodId == null
              ? Container(
                  padding: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    border: BorderDirectional(
                      bottom: BorderSide(
                        color: Color(0xFFE8EBF0),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/hole_icon.png",
                        scale: 1.5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Choisir la mise en jeu",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF9AA6AC),
                            )),
                      ),
                    ],
                  ),
                )
              : chosenMethod(
                  partieProvider.methods
                      .firstWhere((element) => element.id == shot.methodId)
                      .name,
                ),
          children: [...list],
        ),
      ),
    );
  }
}
