import 'package:flutter/material.dart';
import 'package:golf_app/components/about.dart';
import 'package:golf_app/components/branding.dart';
import 'package:golf_app/components/halfBackground.dart';
import 'package:golf_app/components/logInButton.dart';
import 'package:golf_app/components/registerButton.dart';

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
          Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                cRButtons(),
                Branding(),
                About(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
