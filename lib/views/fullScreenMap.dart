import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/map.dart';

class FullScreenMap extends StatelessWidget {
  final int nbTrou;
  FullScreenMap({this.nbTrou});
  static Route<dynamic> route(int nbTrou) =>
      MaterialPageRoute(builder: (context) => FullScreenMap(nbTrou: nbTrou));
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(
            children: [
              Map(nbTrou: nbTrou),
              BackButton(
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
