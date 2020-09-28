import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/auth.dart';
import 'package:golf_app/views/home.dart';

class Test extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => Test(),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
      builder: (context) => Center(
        child: GestureDetector(
          onTap: () async {
            ((await Auth.getInstance()).logOutUser()).then((value) {
              if (value == 0) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Logout succesful"),
                  backgroundColor: Colors.green,
                ));
                Navigator.of(context).pushReplacement(Home.route());
              } else {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Error"),
                  backgroundColor: Colors.red,
                ));
              }
            });
          },
          child: Text('You are logged in'),
        ),
      ),
    ));
  }
}
