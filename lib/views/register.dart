import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golf_app/components/RegisterForm/dobField.dart';
import 'package:golf_app/components/RegisterForm/emailField.dart';
import 'package:golf_app/components/RegisterForm/genderSelection.dart';
import 'package:golf_app/components/RegisterForm/nameField.dart';
import 'package:golf_app/components/RegisterForm/numberField.dart';
import 'package:golf_app/components/RegisterForm/passwordField.dart';
import 'package:golf_app/components/RegisterForm/registerButton.dart';
import 'package:golf_app/components/halfBackground.dart';
import 'package:golf_app/models/providers/registerValidation.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => Register(),
      );
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          HalfBackground(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: ChangeNotifierProvider(
              create: (_) => RegisterValidation(),
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
                              Center(
                                child: Text(
                                  "Créer un compte",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              GenderSelection(),
                              NameField(),
                              NameField(nom: false),
                              EmailField(),
                              PasswordField(),
                              DOBField(),
                              NumberField(),
                              RegisterButton(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
