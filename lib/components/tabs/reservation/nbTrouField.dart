import 'package:flutter/material.dart';
import 'package:golf_app/models/interfaces/matche.dart';
import 'package:golf_app/models/providers/reservationProvider.dart';
import 'package:provider/provider.dart';

class NbTrouField extends StatefulWidget {
  @override
  _NbTrouFieldState createState() => _NbTrouFieldState();
}

class _NbTrouFieldState extends State<NbTrouField> {
  List<DropdownMenuItem> initItems(List<Matche> matches) {
    List<DropdownMenuItem> list = [
      DropdownMenuItem(
        child: Center(child: Text("----")),
        value: 0,
      ),
    ];
    for (var matche in matches) {
      list.add(DropdownMenuItem(
        child: Text(matche.name),
        value: matche.id,
      ));
    }
    return list;
  }

  int _value = 0;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final reservationProvider = Provider.of<ReservationProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFEEEEEE)),
        borderRadius: BorderRadius.circular(25),
      ),
      width: 150,
      height: 100,
      child: Column(
        children: [
          Text(
            "Nombre de trous",
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          DropdownButton(
            underline: Container(
              decoration: BoxDecoration(
                border: BorderDirectional(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
            ),
            value: _value,
            items: initItems(reservationProvider.matches),
            onChanged: (value) {
              _value = value;
              reservationProvider.setMatche(value);
            },
          )
        ],
      ),
    );
  }
}
