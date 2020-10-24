import 'package:flutter/material.dart';
import 'package:golf_app/components/fullBackground.dart';
import 'package:golf_app/models/providers/golfBagProvider.dart';
import 'package:provider/provider.dart';

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
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => GolfBagProvider(),
                lazy: false,
              ),
            ],
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  children: [
                    Row(
                      children: [
                        BackButton(
                          color: Colors.white,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    content,
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
