import 'package:flutter/material.dart';
import 'package:golf_app/models/interfaces/validationItem.dart';
import 'package:golf_app/models/providers/registerValidation.dart';
import 'package:provider/provider.dart';

class NumberField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerValidation = Provider.of<RegisterValidation>(context);
    ValidationItem item = registerValidation.number;
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: TextField(
        keyboardType: TextInputType.number,
        maxLength: 8,
        decoration: InputDecoration(
          hintText: "Numéro de télephone",
          errorText: item.error,
        ),
        onChanged: (value) {
          registerValidation.setNumber(value);
        },
      ),
    );
  }
}
