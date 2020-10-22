import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/auth.dart';
import 'package:golf_app/models/providers/menuProvider.dart';
import 'package:golf_app/views/home.dart';
import 'package:provider/provider.dart';

class LogOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final menuProvider = Provider.of<MenuProvider>(context, listen: false);
    return FlatButton(
      splashColor: Colors.greenAccent,
      color: theme.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      onPressed: () async {
        ((await Auth.getInstance()).logOutUser()).then((value) {
          if (value == 0) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Logout succesful"),
              backgroundColor: Colors.green,
            ));
            Navigator.of(context).pushReplacement(Home.route());
            menuProvider.goToHomeTabWithouNotfiying();
          } else {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Error"),
              backgroundColor: Colors.red,
            ));
          }
        });
      },
      child: Text(
        "Se déconnecter",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
