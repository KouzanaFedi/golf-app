import 'package:flutter/material.dart';
import 'package:golf_app/models/interfaces/user.dart';
import 'package:golf_app/models/providers/logInValidation.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:golf_app/utils/deviceUtils.dart';
import 'package:golf_app/views/acceuil.dart';
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
    final userProvider = Provider.of<UserProvider>(context);
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
                DeviceUtils.hideKeyboard(context);
                setState(() {
                  loading = true;
                });
                User user = await logInValidation.logInUser();

                setState(() {
                  loading = false;
                });
                if (user != null) {
                  Navigator.of(context).pushReplacement(Acceuil.route(user));
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
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
