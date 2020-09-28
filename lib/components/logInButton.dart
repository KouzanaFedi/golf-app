import 'package:flutter/material.dart';
import '../views/logIn.dart';

class LogInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return FlatButton(
      splashColor: Colors.greenAccent,
      color: theme.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      onPressed: () => Navigator.of(context).push(LogIn.route()),
      child: Text(
        "Se connecter",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
