import 'package:flutter/material.dart';
import 'package:golf_app/models/interfaces/validationItem.dart';
import 'package:golf_app/models/providers/registerValidation.dart';
import 'package:golf_app/utils/deviceUtils.dart';
import 'package:provider/provider.dart';

class DOBField extends StatelessWidget {
  const DOBField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final registerValidation = Provider.of<RegisterValidation>(context);
    ValidationItem item = registerValidation.dob;

    String d = (item.value == null) ? "DD" : item.value.split('-')[2];
    String m = (item.value == null) ? "MM" : item.value.split('-')[1];
    String y = (item.value == null) ? "YYYY" : item.value.split('-')[0];

    BoxDecoration boxDecoration = BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(
          color: (item.error == null) ? Colors.grey : Colors.red[700],
          width: (item.error == null) ? 1 : 2,
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date de naissence",
          style: TextStyle(color: Colors.grey[600]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              height: 30,
              decoration: boxDecoration,
              child: Center(child: Text(d)),
            ),
            Container(
              width: 40,
              height: 30,
              decoration: boxDecoration,
              child: Center(child: Text(m)),
            ),
            Container(
              width: 60,
              height: 30,
              decoration: boxDecoration,
              child: Center(child: Text(y)),
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
                    DeviceUtils.hideKeyboard(context);
                    showDatePicker(
                      initialDatePickerMode: DatePickerMode.year,
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1940),
                      lastDate: DateTime.now(),
                    ).then((value) {
                      if (value != null) {
                        registerValidation.setDOB(
                            value.year, value.month, value.day);
                      }
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        (item.error == null)
            ? Container()
            : Text(
                item.error,
                style: TextStyle(
                  color: Colors.red[700],
                  fontSize: 12,
                ),
              ),
      ],
    );
  }
}
