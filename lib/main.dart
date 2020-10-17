import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:golf_app/models/providers/menuProvider.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:golf_app/views/splashScreen.dart';
import 'package:provider/provider.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MenuProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Color(0xFF2ED199),
            textSelectionColor: Color(0xFF9EAAB0),
            colorScheme: ColorScheme.light(
              primary: Color(0xFF2ED199),
            ),
            accentColor: Colors.grey,
            fontFamily: "poppins",
          ),
          home: SplashScreen()),
    );
  }
}
