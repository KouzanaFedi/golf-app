import 'package:flutter/material.dart';
import 'package:golf_app/components/partie/holeHeader.dart';
import 'package:golf_app/components/partie/holeMap.dart';
import 'package:golf_app/components/partie/metaInfo.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:provider/provider.dart';

class PartieView extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => PartieView());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<PartieProvider>(
          builder: (context, value, child) {
            if (value.trous.length == 0) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else
              return Column(
                children: [
                  HoleHeader(),
                  MetaInfo(),
                  HoleMap(),
                ],
              );
          },
        ),
      ),
    );
  }
}
