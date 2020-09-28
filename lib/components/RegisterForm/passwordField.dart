import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golf_app/models/interfaces/validationItem.dart';
import 'package:golf_app/models/providers/registerValidation.dart';
import 'package:provider/provider.dart';

class PasswordField extends StatefulWidget {
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool hidden = true;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final registerValidation = Provider.of<RegisterValidation>(context);
    ValidationItem item = registerValidation.password;
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: hidden,
        maxLength: 24,
        decoration: InputDecoration(
          hintText: "Mot de passe",
          suffixIcon: ClipOval(
            child: Material(
              color: Colors.transparent, // button color
              child: InkWell(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(
                    (hidden) ? Icons.visibility : Icons.visibility_off,
                    color: (hidden) ? theme.primaryColor : Colors.grey,
                  ),
                ),
                onTap: () {
                  setState(() {
                    hidden = !hidden;
                  });
                },
              ),
            ),
          ),
          errorText: item.error,
        ),
        onChanged: (value) {
          registerValidation.setPassword(value);
        },
      ),
    );
  }
}
