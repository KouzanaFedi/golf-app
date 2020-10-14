import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/HoleCard.dart';
import 'package:golf_app/components/menuOptions/map.dart';

class Parcours extends StatefulWidget {
  @override
  _ParcoursState createState() => _ParcoursState();
}

class _ParcoursState extends State<Parcours> {
  // PageController _pageController;
  List<int> holes = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  bool isParcours = true;
  int initialPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: (isParcours) ? view2D(initialPage) : mapView(),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
      ),
    );
  }

  Widget view2D(int initialPage) {
    PageController _pageController =
        PageController(viewportFraction: .8, initialPage: initialPage);

    return Column(
      key: UniqueKey(),
      children: [
        SizedBox(
          height: 400,
          child: PageView.builder(
            itemCount: holes.length,
            controller: _pageController,
            itemBuilder: (context, index) => Center(
              child: AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double ratio = 1;
                  if (_pageController.position.haveDimensions) {
                    ratio = _pageController.page - index;
                    ratio = (1 - (ratio.abs() * 0.3)).clamp(0, 1);
                  } else if (index != initialPage) {
                    ratio = 0.7;
                  }

                  return SizedBox(
                    width: Curves.easeInOut.transform(ratio) * 300,
                    height: Curves.easeInOut.transform(ratio) * 400,
                    child: HoleCard(
                      index: holes[index],
                    ),
                  );
                },
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
              setState(() {
                if (isParcours == true) isParcours = false;
              });
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

  Widget mapView() => Column(
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
                setState(() {
                  if (isParcours == false) isParcours = true;
                });
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
