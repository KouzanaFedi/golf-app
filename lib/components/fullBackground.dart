import 'package:flutter/material.dart';

class FullBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/background.png",
            fit: BoxFit.fitWidth,
          ),
          Opacity(
            opacity: .4,
            child: Container(
              color: Color(0xFF1E1D1D),
            ),
          ),
        ],
      ),
    );
  }
}
