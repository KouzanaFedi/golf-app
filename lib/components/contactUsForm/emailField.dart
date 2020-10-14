import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/contactValidation.dart';
import 'package:provider/provider.dart';

class EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contactValidation = Provider.of<ContactValidation>(context);
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: "Adresse e-mail",
          errorText: contactValidation.email.error,
        ),
        onChanged: (value) {
          contactValidation.setEmail(value);
        },
      ),
    );
  }
}
