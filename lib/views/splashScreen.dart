import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/auth.dart';
import 'package:golf_app/components/animatedLogo.dart';
import 'package:golf_app/components/branding.dart';
import 'package:golf_app/components/copyrights.dart';
import 'package:golf_app/views/home.dart';
import 'package:golf_app/views/acceuil.dart';

class SplashScreen extends StatelessWidget {
  Widget brand() => Container(
        child: Column(
          children: [
            AnimatedLogo(
              width: 60,
            ),
            Branding(),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: FutureBuilder<Auth>(
          future: Auth.getInstance(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Scaffold(
                resizeToAvoidBottomPadding: false,
                backgroundColor: theme.primaryColor,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    brand(),
                    Copyrights(),
                  ],
                ),
              );
            else if (snapshot.hasData && snapshot.data.isAuth()) {
              return Acceuil();
            } else
              return Home();
          }),
    );
  }
}
