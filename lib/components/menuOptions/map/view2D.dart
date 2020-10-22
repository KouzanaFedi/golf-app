import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/HoleCard.dart';
import 'package:golf_app/models/providers/trousProvider.dart';
import 'package:provider/provider.dart';

class View2D extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final trouProvider = Provider.of<TrouProvider>(context);
    PageController _pageController =
        PageController(viewportFraction: .87, initialPage: trouProvider.page);

    return Column(
      key: UniqueKey(),
      children: [
        SizedBox(
          height: 400,
          child: PageView.builder(
            itemCount: trouProvider.trouList.length,
            controller: _pageController,
            itemBuilder: (context, index) => Center(
              child: HoleCard(
                trou: trouProvider.trouList[index],
              ),
            ),
          ),
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
              trouProvider.setMapView();
            },
            child: Container(
              height: 50,
              width: 220,
              alignment: Alignment.center,
              child: Text(
                "Voir map",
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
