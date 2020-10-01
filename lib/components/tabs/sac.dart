import 'package:flutter/material.dart';
import 'package:golf_app/components/bag/bag.dart';
import 'package:golf_app/components/bag/clubs.dart';
import 'package:golf_app/models/providers/golfBag.dart';
import 'package:provider/provider.dart';

class Sac extends StatefulWidget {
  @override
  _SacState createState() => _SacState();
}

class _SacState extends State<Sac> {
  List<int> clubs = [];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GolfBag(),
      child: Container(
        width: 300,
        height: 400,
        child: Row(
          children: [
            Bag(),
            Clubs(),
          ],
        ),
      ),
    );
  }
}
