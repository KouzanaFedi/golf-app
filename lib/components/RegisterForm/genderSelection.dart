import 'package:flutter/material.dart';
import 'package:golf_app/models/interfaces/validationItem.dart';
import 'package:golf_app/models/providers/registerValidation.dart';
import 'package:golf_app/utils/custom_icons_icons.dart';
import 'package:provider/provider.dart';

class GenderSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerValidation = Provider.of<RegisterValidation>(context);
    ValidationItem item = registerValidation.gender;
    ThemeData theme = Theme.of(context);

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
              height: 35,
              decoration: BoxDecoration(
                color:
                    (item.value == "homme") ? theme.primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: (item.value == "homme")
                      ? Colors.transparent
                      : Color(0xFF9AA6AC),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Golfeur",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: (item.value == "homme")
                            ? Colors.white
                            : Color(0xFF9AA6AC),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Icon(
                        CustomIcons.male,
                        color: (item.value == "homme")
                            ? Colors.white
                            : Color(0xFF9AA6AC),
                        size: 20,
                      ),
                    )
                  ],
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
              height: 35,
              decoration: BoxDecoration(
                color:
                    (item.value == "femme") ? theme.primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: (item.value == "femme")
                      ? Colors.transparent
                      : Color(0xFF9AA6AC),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Golfeuse",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: (item.value == "femme")
                            ? Colors.white
                            : Color(0xFF9AA6AC),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Icon(
                        CustomIcons.female,
                        color: (item.value == "femme")
                            ? Colors.white
                            : Color(0xFF9AA6AC),
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
