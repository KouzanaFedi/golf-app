import 'package:flutter/material.dart';
import 'package:golf_app/models/interfaces/validationItem.dart';
import 'package:golf_app/models/providers/logInValidation.dart';
import 'package:provider/provider.dart';

class EmailField extends StatelessWidget {
  final String email;
  EmailField({this.email});

  @override
  Widget build(BuildContext context) {
    final logInValidation = Provider.of<LogInValidation>(context);
    ValidationItem item = logInValidation.email;
    if (email != null) logInValidation.setInitEmail(email);
    return TextField(
      controller:
          email != null ? (TextEditingController()..text = email) : null,
      enableSuggestions: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Adresse e-mail",
        errorText: item.error,
      ),
      onChanged: (value) {
        logInValidation.setEmail(value);
      },
    );
  }
}
