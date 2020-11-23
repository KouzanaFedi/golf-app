import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/optionsProvider.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:provider/provider.dart';

class NameEditField extends StatelessWidget {
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
            "Nom et prénom",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
        optionsProvider.editing
            ? TextFormField(
                initialValue: userProvider.user != null
                    ? userProvider.user.name
                    : "Chargement",
                onChanged: (value) {
                  optionsProvider.setName(value);
                },
                decoration: InputDecoration(
                  errorText: optionsProvider.nameError,
                ),
              )
            : Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                alignment: Alignment.centerLeft,
                child: Text(
                  userProvider.user != null
                      ? userProvider.user.name
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
