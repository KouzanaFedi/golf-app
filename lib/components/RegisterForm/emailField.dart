import 'package:flutter/material.dart';
import 'package:golf_app/models/interfaces/validationItem.dart';
import 'package:golf_app/models/providers/registerValidation.dart';
import 'package:provider/provider.dart';

class EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerValidation = Provider.of<RegisterValidation>(context);
    ValidationItem item = registerValidation.email;
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Adresse e-mail",
        errorText: item.error,
      ),
      onChanged: (value) {
        registerValidation.setEmail(value);
      },
    );
  }
}
