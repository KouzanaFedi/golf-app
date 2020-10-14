import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/registerValidation.dart';
import 'package:golf_app/utils/deviceUtils.dart';
import 'package:provider/provider.dart';

class RegisterButton extends StatefulWidget {
  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size screenSize = MediaQuery.of(context).size;
    final registerValidation = Provider.of<RegisterValidation>(context);
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
        onPressed: (registerValidation.canRegister != null)
            ? () async {
                DeviceUtils.hideKeyboard(context);
                setState(() {
                  loading = true;
                });
                int rep = await registerValidation.registerUser();

                setState(() {
                  loading = false;
                });

                if (rep == 0) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Register succesful"),
                    backgroundColor: Colors.green,
                  ));
                  registerValidation.setRegistred();
                } else if (rep == -1) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Error"),
                    backgroundColor: Colors.red,
                  ));
                } else {
                  registerValidation.setEmail("");
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Email déjà utilisé."),
                    backgroundColor: Colors.grey,
                  ));
                }
              }
            : null,
        child: Container(
          width: screenSize.width * .7,
          alignment: Alignment.center,
          child: (!loading)
              ? Text(
                  "Register",
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
