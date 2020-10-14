import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/contactValidation.dart';
import 'package:provider/provider.dart';

class ContactButton extends StatefulWidget {
  @override
  _ContactButtonState createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final contactValidation = Provider.of<ContactValidation>(context);
    ThemeData theme = Theme.of(context);
    return FlatButton(
      disabledColor: Colors.grey,
      splashColor: Colors.greenAccent,
      color: theme.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      onPressed: (contactValidation.canSubmit)
          ? () async {
              setState(() {
                loading = true;
              });
              bool res = await contactValidation.submitContact();
              setState(() {
                loading = false;
              });
              if (res) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Votre message a été bien envoyer."),
                  backgroundColor: Colors.green,
                ));
                contactValidation.setIsSend();
              } else {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        "Erreur durant l'envoye de votre message, essayez plus tard."),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            }
          : null,
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        alignment: Alignment.center,
        child: (loading)
            ? Center(
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(),
                ),
              )
            : Text(
                "CONTACTEZ NOUS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}
