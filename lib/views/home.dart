import 'package:flutter/material.dart';
import 'package:golf_app/components/navigationBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Widget background() => Container(
          child: Image.asset(
            "assets/half_background.png",
            fit: BoxFit.fitHeight,
          ),
        );

    Widget connectButton() => FlatButton(
          splashColor: Colors.greenAccent,
          color: theme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          onPressed: () {},
          child: Text(
            "Se connecter",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        );

    Widget registerButton() => FlatButton(
          splashColor: Colors.white,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          onPressed: () {},
          child: Text(
            "Créer un compte",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        );

    Widget cRButtons() => Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Row(
            children: [
              connectButton(),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: registerButton(),
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
    Widget content() => Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text(
                        "A propos",
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer quis arcu tortor. Vivamus condimentum rhoncus massa, sed aliquam dui euismod eget. Quisque efficitur non tellus et gravida. Nunc vel varius nulla. Praesent suscipit, massa quis efficitur convallis, lorem tortor elementum urna, sed molestie metus mauris nec lectus. Nunc vitae est massa. Etiam urna est, fermentum eu lorem ullamcorper, varius scelerisque erat. Duis et est vel tellus imperdiet faucibus in nec mauris. Suspendisse at varius mauris. Praesent diam justo, luctus sit amet pellentesque non, facilisis sit amet massa. Morbi velit nulla, hendrerit ut suscipit quis, varius id nibh.",
                      style: TextStyle(
                        color: theme.textSelectionColor,
                        fontSize: 12,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        "Services",
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: theme.textSelectionColor,
                                ),
                              ),
                            ),
                            Text(
                              "9 trous",
                              style: TextStyle(
                                color: theme.textSelectionColor,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: theme.textSelectionColor,
                                ),
                              ),
                            ),
                            Text(
                              "18 trous",
                              style: TextStyle(
                                color: theme.textSelectionColor,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: theme.textSelectionColor,
                                ),
                              ),
                            ),
                            Text(
                              "Voiturette",
                              style: TextStyle(
                                color: theme.textSelectionColor,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: theme.textSelectionColor,
                                ),
                              ),
                            ),
                            Text(
                              "Restaurant",
                              style: TextStyle(
                                color: theme.textSelectionColor,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Voir plus de services",
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                content(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
