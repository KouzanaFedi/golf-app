import 'package:flutter/material.dart';
import 'package:golf_app/components/fullBackground.dart';

class Options extends StatelessWidget {
  final Widget content;
  final String title;
  Options({this.content, this.title});
  static Route<dynamic> route(Widget content, String title) =>
      MaterialPageRoute(
        builder: (context) => Options(
          content: content,
          title: title,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          FullBackground(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButton(
                      color: Colors.white,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      width: 50,
                    )
                  ],
                ),
                content,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
