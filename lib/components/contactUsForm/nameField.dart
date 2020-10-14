import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/contactValidation.dart';
import 'package:provider/provider.dart';

class NameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contactValidation = Provider.of<ContactValidation>(context);

    return TextField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "Nom",
        errorText: contactValidation.nom.error,
      ),
      onChanged: (value) {
        contactValidation.setNom(value);
      },
    );
  }
}
