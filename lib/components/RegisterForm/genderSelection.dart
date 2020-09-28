import 'package:flutter/material.dart';
import 'package:golf_app/models/interfaces/validationItem.dart';
import 'package:golf_app/models/providers/registerValidation.dart';
import 'package:provider/provider.dart';

class GenderSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerValidation = Provider.of<RegisterValidation>(context);
    ValidationItem item = registerValidation.gender;
    ThemeData theme = Theme.of(context);
    Color activeColor = Colors.white;
    Color disabledColor = Colors.black;
    BoxDecoration active = BoxDecoration(
      color: theme.primaryColor,
      borderRadius: BorderRadius.circular(15),
    );

    BoxDecoration disabled = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(),
    );
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => (!(item.value == "homme"))
                ? registerValidation.setGender("homme")
                : null,
            child: Container(
              width: 120,
              height: 30,
              decoration: (item.value == "homme") ? active : disabled,
              child: Center(
                child: Text(
                  "Golfeur",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color:
                        (item.value == "homme") ? activeColor : disabledColor,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => (!(item.value == "femme"))
                ? registerValidation.setGender("femme")
                : null,
            child: Container(
              width: 120,
              height: 30,
              decoration: (item.value == "femme") ? active : disabled,
              child: Center(
                child: Text(
                  "Golfeuse",
                  style: TextStyle(
                    fontSize: 15,
                    color:
                        (item.value == "femme") ? activeColor : disabledColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
