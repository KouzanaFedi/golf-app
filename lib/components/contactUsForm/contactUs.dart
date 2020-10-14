import 'package:flutter/material.dart';
import 'package:golf_app/components/contactUsForm/contactButton.dart';
import 'package:golf_app/components/contactUsForm/contactSucces.dart';
import 'package:golf_app/components/contactUsForm/emailField.dart';
import 'package:golf_app/components/contactUsForm/msgField.dart';
import 'package:golf_app/components/contactUsForm/nameField.dart';
import 'package:golf_app/models/providers/contactValidation.dart';
import 'package:provider/provider.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contactValidation = Provider.of<ContactValidation>(context);
    ThemeData theme = Theme.of(context);
    TextStyle titleStyle = TextStyle(
      color: theme.primaryColor,
      fontSize: 17,
    );
    double paddingBetweenItems = 15;

    Widget formulaire() => Column(
          children: [
            NameField(),
            EmailField(),
            MsgField(),
            ContactButton(),
          ],
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              bottom: paddingBetweenItems, top: paddingBetweenItems),
          child: Text("Contactez nous", style: titleStyle),
        ),
        (contactValidation.isSend) ? ContactSucces() : formulaire(),
        Container(
          height: 25,
        ),
      ],
    );
  }
}
