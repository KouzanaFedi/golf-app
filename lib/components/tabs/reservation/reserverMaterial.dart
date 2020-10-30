import 'package:flutter/material.dart';
import 'package:golf_app/components/tabs/reservation/locationItemCard.dart';
import 'package:golf_app/models/interfaces/locationItem.dart';
import 'package:golf_app/models/providers/reservationProvider.dart';
import 'package:provider/provider.dart';

class ReserverMaterial extends StatelessWidget {
  Widget generateLocationItems(List<LocationItem> items) {
    List<Widget> widgets = [];
    for (var item in items) {
      widgets.add(LocationItemCard(
        id: item.id,
        name: item.name,
      ));
    }
    return Wrap(
      children: widgets,
      spacing: 15,
      runSpacing: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    final reservationProvider = Provider.of<ReservationProvider>(context);
    ThemeData theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Text(
            "Tarifs locations des matériels",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        generateLocationItems(reservationProvider.locationItem),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          height: 50,
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Cout :",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                " ${reservationProvider.tarif}dt",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Color(0xFFEEEEEE),
            ),
          ),
        ),
        FlatButton(
          disabledColor: Colors.grey,
          splashColor: Colors.greenAccent,
          color: theme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          onPressed: () {
            reservationProvider.setDone();
          },
          child: Container(
            width: MediaQuery.of(context).size.width * .7,
            padding: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            child: Text(
              "Terminer",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Container(
          height: 70,
        )
      ],
    );
  }
}
