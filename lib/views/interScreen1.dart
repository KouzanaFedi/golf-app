import 'dart:io';

import 'package:flutter/material.dart';
import 'package:golf_app/api/client.dart';
import 'package:golf_app/api/requests/auth.dart';
import 'package:golf_app/components/tabs/profile/partieRadar.dart';
import 'package:golf_app/models/interfaces/user.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:golf_app/utils/sharedPref.dart';
import 'package:golf_app/views/home.dart';
import 'package:golf_app/views/acceuil.dart';
import 'package:golf_app/views/partieView.dart';
import 'package:golf_app/views/splashScreen.dart';
import 'package:provider/provider.dart';

class InterScreen1 extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => InterScreen1(),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
          future: Future.wait([
            Auth.getInstance(),
            Auth.getInstance().then((value) => value.getUser()),
            SharedPref.getInstance(),
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return SplashScreen();
            else if (snapshot.hasData && (snapshot.data[0] as Auth).isAuth()) {
              Client.getInstance().setToken((snapshot.data[0] as Auth).token);
              Provider.of<UserProvider>(context)
                  .setUser(snapshot.data[1] as User);
              if ((snapshot.data[2] as SharedPref).isGameStartedExists()) {
                return PartieView();
              } else
                return Acceuil();
            } else
              return Home();
          }),
    );
  }
}
