import 'package:flutter/material.dart';
import 'package:golf_app/components/animatedLogo.dart';
import 'package:golf_app/components/branding.dart';
import 'package:golf_app/components/copyrights.dart';

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
  }
}
