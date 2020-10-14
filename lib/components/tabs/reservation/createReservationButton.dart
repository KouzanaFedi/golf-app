import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/reservationProvider.dart';
import 'package:provider/provider.dart';

class CreateReservationButton extends StatefulWidget {
  @override
  _CreateReservationButtonState createState() =>
      _CreateReservationButtonState();
}

class _CreateReservationButtonState extends State<CreateReservationButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final reservationProvider = Provider.of<ReservationProvider>(context);

    return FlatButton(
      disabledColor: Colors.grey,
      splashColor: Colors.greenAccent,
      color: theme.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      onPressed: reservationProvider.canReserve
          ? () async {
              setState(() {
                loading = true;
              });
              reservationProvider.createReservation().then((_) {
                setState(() {
                  loading = false;
                });
                if (!reservationProvider.haveReservation) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content:
                        Text("Erreur durant la creation de la reservation."),
                    backgroundColor: Colors.red,
                  ));
                }
              });
            }
          : null,
      child: Container(
        width: MediaQuery.of(context).size.width * .7,
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: (!loading)
            ? Text(
                "Suivant",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              )
            : Center(
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
    );
  }
}
