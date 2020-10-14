import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/reservationProvider.dart';
import 'package:provider/provider.dart';

class Tarif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reservationProvider = Provider.of<ReservationProvider>(context);

    return (reservationProvider.haveMatche)
        ? Container(
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
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
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
          )
        : Container(
            height: 20,
          );
  }
}
