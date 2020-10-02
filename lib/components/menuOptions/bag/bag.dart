import 'dart:math';

import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/golfBagProvider.dart';
import 'package:provider/provider.dart';

class Bag extends StatelessWidget {
  List<Widget> generateClubs(List<int> myClubs) {
    if (myClubs != null) {
      List<Widget> clubs = [];
      int index = 0;
      for (var _ in myClubs) {
        clubs.add(
          Positioned(
            top: 20 + (20.0 * (index % 3)),
            left: 20 + ((7.5 * index)) % 60,
            child: Transform(
              transform: Matrix4.rotationZ(-(pi / 14))
                ..rotateY(pi * (index % 2)), //
              child: Image.asset(
                "assets/clubs/hybrid_club.png",
                width: 20,
              ),
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
    final golfBag = Provider.of<GolfBagProvider>(context);
    return DragTarget(
      builder: (context, List<int> candidateData, rejectedData) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Container(
                width: 200,
                height: 320,
                alignment: Alignment.bottomCenter,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                        top: 73,
                        left: 72,
                        child: Image.asset("assets/clubs/bagMouth.png")),
                    Positioned(
                      top: 0,
                      left: 45,
                      child: Container(
                        width: 110,
                        height: 150,
                        child: Stack(
                          children: [...generateClubs(golfBag.myClubs)],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 45,
                      child: Image.asset(
                        "assets/clubs/bagEmpty.png",
                        height: 224,
                        width: 116,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: Text(
                    "${golfBag.myClubs.length}/14",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF9AA6AC),
                    ),
                  ),
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
