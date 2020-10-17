import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/bag/bag.dart';
import 'package:golf_app/components/menuOptions/bag/clubs.dart';
import 'package:golf_app/components/menuOptions/bag/submitButton.dart';

class Sac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "Pour modifier le contenu de votre sac de golf, faites un glisser-déposer des clubs dans le sac du golf.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Container(
          width: 300,
          height: 320,
          child: Row(
            children: [
              Bag(),
              Clubs(),
            ],
          ),
        ),
        SubmitButton(),
      ],
    );
  }
}
