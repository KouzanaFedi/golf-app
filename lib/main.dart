import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:golf_app/views/home.dart';
import 'package:golf_app/views/splashScreen.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF2ED199),
        textSelectionColor: Color(0xFF9EAAB0),
        colorScheme: ColorScheme.light(
          primary: Color(0xFF2ED199),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
