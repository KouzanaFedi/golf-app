import 'package:flutter/material.dart';
import 'package:golf_app/components/about.dart';
import 'package:golf_app/components/branding.dart';
import 'package:golf_app/components/contactUsForm/contactUs.dart';
import 'package:golf_app/components/halfBackground.dart';
import 'package:golf_app/components/logInButton.dart';
import 'package:golf_app/components/registerButton.dart';
import 'package:golf_app/models/providers/contactValidation.dart';
import 'package:golf_app/models/providers/logInValidation.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => Home(),
      );
  @override
  Widget build(BuildContext context) {
    Widget cRButtons() => Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Row(
            children: [
              LogInButton(),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: RegisterButton(),
              ),
            ],
          ),
        );

    return SafeArea(
      child: Stack(
        children: [
          HalfBackground(),
          ChangeNotifierProvider(
            create: (context) => ContactValidation(),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  cRButtons(),
                  Branding(),
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
                        child: Column(
                          children: [
                            About(),
                            ContactUs(),
                          ],
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
