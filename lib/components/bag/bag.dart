import 'package:flutter/material.dart';
import 'package:golf_app/components/bag/club.dart';

class Bag extends StatefulWidget {
  final List<int> clubs;

  Bag({@required this.clubs});

  @override
  _BagState createState() => _BagState();
}

class _BagState extends State<Bag> {
  List<Widget> generateClubs() {
    if (widget.clubs.length > 0) {
      List<Widget> clubs = [];
      for (var club in widget.clubs) {
        clubs.add(Club(index: club));
      }
      return clubs;
    } else
      return [Container()];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 350,
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView(
        children: [...generateClubs()],
      ),
    );
  }
}
