import 'package:flutter/material.dart';
import 'package:golf_app/models/interfaces/validationItem.dart';
import 'package:golf_app/models/providers/registerValidation.dart';
import 'package:provider/provider.dart';

class NameField extends StatelessWidget {
  final bool nom;
  NameField({this.nom = true});

  @override
  Widget build(BuildContext context) {
    final registerValidation = Provider.of<RegisterValidation>(context);
    ValidationItem item =
        (nom) ? registerValidation.nom : registerValidation.prenom;
    return TextField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: (nom) ? "Nom" : "Prénom",
        errorText: item.error,
      ),
      onChanged: (value) {
        if (nom)
          registerValidation.setNom(value);
        else
          registerValidation.setPrenom(value);
      },
    );
  }
}
