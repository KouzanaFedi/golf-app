import 'dart:io';

import 'package:flutter/material.dart';
import 'package:golf_app/api/client.dart';
import 'package:golf_app/api/requests/auth.dart';
import 'package:golf_app/api/requests/partie.dart';
import 'package:golf_app/components/animatedLogo.dart';
import 'package:golf_app/components/branding.dart';
import 'package:golf_app/components/copyrights.dart';
import 'package:golf_app/models/interfaces/partieModel.dart';
import 'package:golf_app/models/interfaces/user.dart';
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
      child: FutureBuilder(
          future: Future.wait([
            Auth.getInstance(),
            Auth.getInstance().then((value) => value.getUser()),
          ]),
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
            else if (snapshot.hasData && (snapshot.data[0] as Auth).isAuth()) {
              Client.getInstance().setToken((snapshot.data[0] as Auth).token);
              return Acceuil(
                user: snapshot.data[1] as User,
              );
            } else
              return Home();
          }),
    );
  }
}
