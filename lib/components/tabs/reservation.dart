import 'package:flutter/material.dart';
import 'package:golf_app/components/tabs/reservation/reservationRecap.dart';
import 'package:golf_app/components/tabs/reservation/reserver.dart';
import 'package:golf_app/components/tabs/reservation/reserverMaterial.dart';
import 'package:golf_app/models/providers/reservationProvider.dart';
import 'package:provider/provider.dart';

class Reservation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reservationProvider = Provider.of<ReservationProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.only(top: 25, left: 25, right: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: !reservationProvider.done
            ? (reservationProvider.haveReservation
                ? ReserverMaterial()
                : Reserver())
            : ReservationRecap(),
      ),
    );
  }
}
