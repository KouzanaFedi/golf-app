import 'package:flutter/material.dart';
import 'package:golf_app/components/partie/clubsChoice.dart';
import 'package:golf_app/components/partie/methodsChoice.dart';
import 'package:golf_app/components/partie/modifyButton.dart';
import 'package:golf_app/components/partie/radioBoxes.dart';
import 'package:golf_app/components/partie/shotHeader.dart';
import 'package:golf_app/components/partie/switcherField.dart';
import 'package:golf_app/components/partie/validateButton.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:provider/provider.dart';

class PartieBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final partieProvider = Provider.of<PartieProvider>(context);
    int holeNb = partieProvider.currentHole;
    int shotNb = partieProvider.currentShot;
    final shot = partieProvider.holePlayed[holeNb].shots[shotNb];

    return Container(
      padding: EdgeInsets.only(top: 25, left: 25, right: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(50),
          topEnd: Radius.circular(50),
        ),
      ),
      height: screenSize.height * .8,
      width: screenSize.width,
      child: Consumer<PartieProvider>(
        builder: (context, value, child) {
          if (value.myClubs.length == 0 && value.methods.length == 0) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return SingleChildScrollView(
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Color(0xFF9AA6AC),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(text: "Par "),
                        TextSpan(
                          text:
                              "${partieProvider.trous[partieProvider.currentHole].par} / ",
                          style: TextStyle(
                            color: Color(0xFF4D4D4D),
                          ),
                        ),
                        TextSpan(text: "Index "),
                        TextSpan(
                          text:
                              "${partieProvider.trous[partieProvider.currentHole].strokeIndex}",
                          style: TextStyle(
                            color: Color(0xFF4D4D4D),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ShotHeader(),
                  ClubsChoice(),
                  MethodsChoice(),
                  RadioBoxes(),
                  SwitcherField(),
                  !shot.send ? ValidateButton() : ModifyButton(),
                ],
              ),
            );
        },
      ),
    );
  }
}
