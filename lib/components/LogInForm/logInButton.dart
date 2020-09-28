import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/logInValidation.dart';
import 'package:golf_app/views/test.dart';
import 'package:provider/provider.dart';

class LogInButton extends StatefulWidget {
  @override
  _LogInButtonState createState() => _LogInButtonState();
}

class _LogInButtonState extends State<LogInButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size screenSize = MediaQuery.of(context).size;
    final logInValidation = Provider.of<LogInValidation>(context);
    return Center(
      child: FlatButton(
        disabledColor: Colors.grey,
        splashColor: Colors.greenAccent,
        color: theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        onPressed: (logInValidation.canLogIn)
            ? () async {
                setState(() {
                  loading = true;
                });
                int rep = await logInValidation.logInUser();
                setState(() {
                  loading = false;
                });
                if (rep == 0) {
                  Navigator.of(context).pushReplacement(Test.route());
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Mot de passe incorrect"),
                    backgroundColor: Colors.red,
                  ));
                }
              }
            : null,
        child: Container(
          width: screenSize.width * .7,
          alignment: Alignment.center,
          child: (!loading)
              ? Text(
                  "Connecte",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Center(
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(),
                  ),
                ),
        ),
      ),
    );
  }
}
