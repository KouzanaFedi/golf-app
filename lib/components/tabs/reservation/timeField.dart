import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/reservationProvider.dart';
import 'package:provider/provider.dart';

class TimeField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reservationProvider = Provider.of<ReservationProvider>(context);
    String item = reservationProvider.time;
    ThemeData theme = Theme.of(context);

    BoxDecoration boxDecoration = BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(
          color: Colors.grey,
          width: 1,
        ),
      ),
    );

    String m = (item == null) ? "--" : item.split(':')[1];
    String h = (item == null) ? "--" : item.split(':')[0];

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFEEEEEE)),
        borderRadius: BorderRadius.circular(25),
      ),
      width: 150,
      height: 100,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Heure",
                  style: TextStyle(
                    color: theme.primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ClipOval(
                child: Material(
                  color: Colors.transparent, // button color
                  child: InkWell(
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.access_alarm,
                        color: theme.primaryColor,
                      ),
                    ),
                    onTap: () {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((value) => reservationProvider.setTime(
                              value.hour, value.minute));
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 35,
                height: 30,
                decoration: boxDecoration,
                child: Center(child: Text(h)),
              ),
              Text(':'),
              Container(
                width: 35,
                height: 30,
                decoration: boxDecoration,
                child: Center(child: Text(m)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
