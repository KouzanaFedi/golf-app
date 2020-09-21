import 'package:flutter/material.dart';
import 'package:golf_app/components/about.dart';
import 'package:golf_app/components/logInButton.dart';
import 'package:golf_app/components/registerButton.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Widget background() => Container(
          child: Image.asset(
            "assets/half_background.png",
            fit: BoxFit.fitHeight,
          ),
        );

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

    Widget branding() => Container(
          padding: EdgeInsets.only(top: 20, bottom: 35),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  "GOLF Course app",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                "TUNIS BAY",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            background(),
            Column(
              children: [
                cRButtons(),
                branding(),
                About(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
