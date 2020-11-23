import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/optionsProvider.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:provider/provider.dart';

class NumberEditField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final optionsProvider = Provider.of<OptionsProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            "Numéro de téléphone",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
        optionsProvider.editing
            ? TextFormField(
                maxLength: 8,
                keyboardType: TextInputType.number,
                initialValue: userProvider.user != null
                    ? userProvider.user.telephone
                    : "Chargement",
                onChanged: (value) {
                  optionsProvider.setNumber(value);
                },
                decoration: InputDecoration(
                  errorText: optionsProvider.numberError,
                ),
              )
            : Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                alignment: Alignment.centerLeft,
                child: Text(
                  userProvider.user != null
                      ? userProvider.user.telephone
                      : "Chargement",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
      ],
    );
  }
}
