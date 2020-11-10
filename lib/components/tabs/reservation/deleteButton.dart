import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/reservationProvider.dart';
import 'package:provider/provider.dart';

class DeleteButton extends StatefulWidget {
  @override
  _DeleteButtonState createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final reservationProvider = Provider.of<ReservationProvider>(context);
    return FlatButton(
      disabledColor: Colors.grey,
      splashColor: Colors.deepOrange[900],
      color: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      onPressed: () async {
        setState(() {
          loading = true;
        });
        reservationProvider.deleteReservation();
        setState(() {
          loading = false;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .7,
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: loading
            ? Center(
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ),
              )
            : Text(
                "Supprimer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}
