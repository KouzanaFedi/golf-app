import 'package:flutter/material.dart';
import 'package:golf_app/components/bag/bag.dart';
import 'package:golf_app/components/bag/club.dart';

class BagView extends StatefulWidget {
  @override
  _BagViewState createState() => _BagViewState();
}

class _BagViewState extends State<BagView> {
  List<int> clubs = [];

  List<Widget> generateClubs() {
    List<Widget> list = [];
    for (var i = 0; i < 10; i++) {
      Club currentClub = Club(
        index: i,
      );
      list.add(Draggable<int>(
        data: i,
        feedback: Material(
          child: currentClub,
          color: Colors.transparent,
        ),
        childWhenDragging: Container(
          margin: EdgeInsets.only(bottom: 10),
          color: Colors.grey,
          width: 75,
          height: 75,
        ),
        child: currentClub,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Center(
              child: DragTarget(
                builder: (context, List<int> candidateData, rejectedData) {
                  return Bag(
                    clubs: clubs,
                  );
                },
                onWillAccept: (data) {
                  return true;
                },
                onAccept: (data) {
                  setState(() {
                    clubs.add(data);
                  });
                },
              ),
            ),
          ),
          Container(
            width: 100,
            color: Colors.amber,
            child: ListView(
              padding: EdgeInsets.all(12),
              children: [
                ...generateClubs(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
