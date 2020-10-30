import 'package:flutter/material.dart';
import 'package:golf_app/components/LogInForm/emailField.dart';
import 'package:golf_app/components/LogInForm/passwordField.dart';
import 'package:golf_app/components/halfBackground.dart';
import 'package:golf_app/components/LogInForm/logInButton.dart';
import 'package:golf_app/models/providers/logInValidation.dart';
import 'package:golf_app/views/register.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  final String email;
  LogIn({this.email});
  static Route<dynamic> route([String email]) => MaterialPageRoute(
        builder: (context) => LogIn(
          email: email,
        ),
      );
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Stack(
        children: [
          HalfBackground(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: ChangeNotifierProvider(
              create: (_) => LogInValidation(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 25, left: 25, right: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 75),
                                child: Center(
                                  child: Text(
                                    "Se connecter",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  EmailField(email: widget.email),
                                  PasswordField(),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 30, bottom: 10),
                                    child: LogInButton(),
                                  ),
                                  Text(
                                    "Vous n'avez pas de compte?",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      "Créer mon compte",
                                      style: TextStyle(
                                        color: theme.primaryColor,
                                        fontSize: 11,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    onTap: () => Navigator.of(context)
                                        .pushReplacement(Register.route()),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
