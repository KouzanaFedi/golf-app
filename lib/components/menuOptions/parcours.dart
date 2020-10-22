import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/map/mapView.dart';
import 'package:golf_app/components/menuOptions/map/view2D.dart';
import 'package:golf_app/models/providers/trousProvider.dart';
import 'package:provider/provider.dart';

class Parcours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final trouProvider = Provider.of<TrouProvider>(context);

    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: (trouProvider.is2DView) ? View2D() : MapView(),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
      ),
    );
  }
}
