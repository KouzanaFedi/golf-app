import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/map/mapView.dart';
import 'package:golf_app/components/menuOptions/map/view2D.dart';
import 'package:golf_app/models/providers/trousProvider.dart';
import 'package:provider/provider.dart';

class Parcours extends StatelessWidget {
  final int nbTrou;
  Parcours({int nbTrou}) : this.nbTrou = nbTrou ?? 18;

  @override
  Widget build(BuildContext context) {
    final trouProvider = Provider.of<TrouProvider>(context);
    print("trous : " + trouProvider.trouList.length.toString());
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Consumer<TrouProvider>(
        builder: (context, value, child) => value.trouList.isNotEmpty
            ? AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: (value.is2DView)
                    ? View2D(nbTrou: nbTrou)
                    : MapView(nbTrou: nbTrou),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
              )
            : Container(
                height: 400,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
      ),
    );
  }
}
