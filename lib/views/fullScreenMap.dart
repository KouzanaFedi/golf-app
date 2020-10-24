import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/map.dart';

class FullScreenMap extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => FullScreenMap());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(
            children: [
              Map(),
              BackButton(
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
