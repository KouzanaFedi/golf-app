import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/contactValidation.dart';
import 'package:provider/provider.dart';

class ContactSucces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final contactValidation = Provider.of<ContactValidation>(context);
    return Center(
      child: Container(
        padding: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width * .7,
        child: Column(
          children: [
            Text(
              "Votre message a été bien ",
              style: TextStyle(
                color: theme.textSelectionColor,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            Text(
              "envoyer.",
              style: TextStyle(
                color: theme.textSelectionColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            GestureDetector(
              child: Text(
                "Envoyer un nouveau message",
                style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 11,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () {
                contactValidation.initForm();
                contactValidation.setIsNotSend();
              },
            ),
          ],
        ),
      ),
    );
  }
}
