import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/reservationProvider.dart';
import 'package:provider/provider.dart';

class ReservationRecap extends StatelessWidget {
  TableRow cell(String name, String tarif) => TableRow(
        children: [
          TableCell(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.grey),
                ),
              ),
              alignment: Alignment.center,
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                name,
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          TableCell(
            child: Container(
              alignment: Alignment.center,
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                tarif,
                style: TextStyle(color: Color(0xFF9AA6AC), fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final reservationProvider = Provider.of<ReservationProvider>(context);
    List<String> date =
        reservationProvider.reservationModel.matcheDate.split(" ");
    List<String> day = date[0].split("-");

    List<TableRow> cells = [];

    if (reservationProvider.haveReservation)
      cells.add(cell(
          reservationProvider
              .matches[reservationProvider.reservationModel.matcheId - 1].name,
          reservationProvider
              .matches[reservationProvider.reservationModel.matcheId - 1]
              .tarif));

    for (var item in reservationProvider.itemsLocatedId) {
      cells.add(cell(reservationProvider.getLocatedItemById(item).name,
          reservationProvider.getLocatedItemById(item).tarif));
    }

    ThemeData theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              "Ma réservation",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              "${day[2]}/${day[1]}/${day[0]} à ${date[1]}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey),
            ),
            child: Table(
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.grey),
                          ),
                        ),
                        alignment: Alignment.center,
                        height: 45,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          "Items",
                          style: TextStyle(
                              color: theme.primaryColor, fontSize: 14),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        alignment: Alignment.center,
                        height: 45,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          "Tarifs",
                          style: TextStyle(
                              color: theme.primaryColor, fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                ),
                TableRow(children: [
                  TableCell(
                      child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.grey),
                      ),
                    ),
                    height: 15,
                  )),
                  TableCell(
                      child: Container(
                    height: 15,
                  ))
                ]),
                ...cells,
                TableRow(children: [
                  TableCell(
                      child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.grey),
                      ),
                    ),
                    height: 25,
                  )),
                  TableCell(
                      child: Container(
                    height: 25,
                  ))
                ]),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              width: 150,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              decoration: BoxDecoration(
                color: Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Text(
                    "TOTAL: ",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "${reservationProvider.tarif.toString()}dt",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
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
              reservationProvider.setUndone();
            },
            child: Container(
                width: MediaQuery.of(context).size.width * .7,
                padding: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                child: Text(
                  "Modifier",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )),
          ),
          FlatButton(
            disabledColor: Colors.grey,
            splashColor: Colors.deepOrange[900],
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            onPressed: () {
              reservationProvider.setUndone();
            },
            child: Container(
                width: MediaQuery.of(context).size.width * .7,
                padding: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                child: Text(
                  "Supprimer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )),
          ),
          Container(
            height: 70,
          ),
        ],
      ),
    );
  }
}
