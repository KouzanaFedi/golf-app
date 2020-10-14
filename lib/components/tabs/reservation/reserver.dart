import 'package:flutter/material.dart';
import 'package:golf_app/components/tabs/reservation/createReservationButton.dart';
import 'package:golf_app/components/tabs/reservation/dateField.dart';
import 'package:golf_app/components/tabs/reservation/nbTrouField.dart';
import 'package:golf_app/components/tabs/reservation/tarif.dart';
import 'package:golf_app/components/tabs/reservation/timeField.dart';

class Reserver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Text(
            "Réserver un parcours",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [DateField(), TimeField()],
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NbTrouField(),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFEEEEEE)),
                  borderRadius: BorderRadius.circular(25),
                ),
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                height: 100,
                child: Column(
                  children: [
                    Text(
                      "Parcours",
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 5, left: 10, right: 10),
                      decoration: BoxDecoration(
                        border: BorderDirectional(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("Panorama"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Tarif(),
        CreateReservationButton(),
        Container(
          height: 70,
        )
      ],
    );
  }
}
