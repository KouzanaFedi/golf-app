import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/golfBagProvider.dart';
import 'package:golf_app/models/providers/logInValidation.dart';
import 'package:golf_app/models/providers/menuProvider.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:golf_app/models/providers/trousProvider.dart';
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
        ChangeNotifierProvider(
          create: (context) => TrouProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GolfBagProvider(),
        ),
        ChangeNotifierProxyProvider2<TrouProvider, GolfBagProvider,
            PartieProvider>(
          create: (context) => PartieProvider(
            trous: Provider.of<TrouProvider>(context, listen: false).trouList,
            myClubs:
                Provider.of<GolfBagProvider>(context, listen: false).myClubs,
            methods: Provider.of<TrouProvider>(context, listen: false).methods,
          ),
          update: (context, value, value2, previous) => PartieProvider(
            trous: value.trouList,
            myClubs: value2.myClubs,
            methods: value.methods,
          ),
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
