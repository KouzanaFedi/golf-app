import 'dart:async';

import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/partie.dart';
import 'package:golf_app/utils/sharedPref.dart';
import 'package:golf_app/views/partieView.dart';
import 'package:golf_app/views/splashScreen.dart';

class InterScreen2 extends StatefulWidget {
  final int partieId;
  InterScreen2({this.partieId});
  static Route<dynamic> route(int partieId) => MaterialPageRoute(
        builder: (context) => InterScreen2(partieId: partieId),
      );
  @override
  _InterScreen2State createState() => _InterScreen2State();
}

class _InterScreen2State extends State<InterScreen2> {
  StreamController<bool> _controller;
  final Partie _partie = Partie.getInstance();
  Timer _timer;
  bool loading = false, streamEmpty = true;

  @override
  void initState() {
    super.initState();
    _controller = StreamController();
    _timer = Timer.periodic(Duration(milliseconds: 3500), (timer) {
      _partie.canStartGame(widget.partieId).then((value) {
        _controller.add(value);
        streamEmpty = false;
        if (value && !streamEmpty) {
          stopStream();
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    stopStream();
  }

  stopStream() {
    _timer.cancel();
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: false,
      stream: _controller.stream,
      builder: (context, snapshot) {
        if (!snapshot.data) {
          return SplashScreen();
        } else {
          SharedPref.getInstance().then((value) {
            value.setGameStarted();
          });
          return PartieView();
        }
      },
    );
  }
}
