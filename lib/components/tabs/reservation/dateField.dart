import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/reservationProvider.dart';
import 'package:provider/provider.dart';

class DateField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime firstDate = now.add(Duration(days: 2));
    ThemeData theme = Theme.of(context);
    final reservationProvider = Provider.of<ReservationProvider>(context);
    String item = reservationProvider.date;

    String d = (item == null) ? "DD" : item.split('-')[2];
    String m = (item == null) ? "MM" : item.split('-')[1];
    String y = (item == null) ? "YYYY" : item.split('-')[0];

    BoxDecoration boxDecoration = BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(
          color: Colors.grey,
          width: 1,
        ),
      ),
    );
    return Container(
      width: 150,
      height: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFEEEEEE)),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  "Date",
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
                        Icons.date_range,
                        color: theme.primaryColor,
                      ),
                    ),
                    onTap: () {
                      showDatePicker(
                        initialDatePickerMode: DatePickerMode.year,
                        context: context,
                        initialDate: firstDate,
                        firstDate: firstDate,
                        lastDate: now.add(Duration(days: 682)),
                      ).then((value) {
                        if (value != null) {
                          reservationProvider.setDate(
                              value.year, value.month, value.day);
                        }
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 35,
                height: 30,
                decoration: boxDecoration,
                child: Center(child: Text(d)),
              ),
              Container(
                width: 35,
                height: 30,
                decoration: boxDecoration,
                child: Center(child: Text(m)),
              ),
              Container(
                width: 50,
                height: 30,
                decoration: boxDecoration,
                child: Center(child: Text(y)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
