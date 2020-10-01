import 'dart:math';

import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/golfBag.dart';
import 'package:provider/provider.dart';

class Bag extends StatelessWidget {
  List<Widget> generateClubs(List<int> myClubs) {
    if (myClubs != null) {
      List<Widget> clubs = [];
      int index = 0;
      for (var _ in myClubs) {
        clubs.add(
          Positioned(
            top: 50 + (20.0 * (index % 3)),
            left: 20 + ((7.5 * index)) % 60,
            child: Transform(
              transform: Matrix4.rotationZ(-(pi / 14))
                ..rotateY(pi * (index % 2)), //
              child: Image.asset("assets/clubs/batton_1.png"),
            ),
          ),
        );
        index++;
      }
      return clubs;
    } else
      return [Container()];
  }

  @override
  Widget build(BuildContext context) {
    final golfBag = Provider.of<GolfBag>(context);
    return DragTarget(
      builder: (context, List<int> candidateData, rejectedData) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  "${golfBag.myClubs.length}/14",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF9AA6AC),
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 350,
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    Positioned(
                        top: 108,
                        left: 72,
                        child: Image.asset("assets/clubs/bagMouth.png")),
                    Positioned(
                      top: 0,
                      left: 45,
                      child: Container(
                        width: 110,
                        height: 250,
                        child: Stack(
                          children: [...generateClubs(golfBag.myClubs)],
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 20,
                        left: 45,
                        child: Image.asset("assets/clubs/bagEmpty.png")),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      onWillAccept: (data) {
        return golfBag.myClubs.length < golfBag.max;
      },
      onAccept: (data) {
        golfBag.addToMyClubs(data);
      },
    );
  }
}
