import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/registerValidation.dart';
import 'package:golf_app/views/logIn.dart';
import 'package:provider/provider.dart';

class Greeting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final registerValidation = Provider.of<RegisterValidation>(context);
    return Container(
      // margin: EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            "Bienvenue",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Divider(
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
          ),
          Text(
            "Un nouveau compte pour",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          Text(
            (registerValidation.email.value != null)
                ? registerValidation.email.value
                : "...............",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Text(
            "a été bien créer.",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(LogIn.route());
              },
              splashColor: Colors.greenAccent,
              color: theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Container(
                  width: MediaQuery.of(context).size.width * .7,
                  alignment: Alignment.center,
                  child: Text(
                    "Poursuivre",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
