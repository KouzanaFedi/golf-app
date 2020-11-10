import 'package:flutter/material.dart';
import 'package:golf_app/components/partie/generalScore/scoreHeader.dart';
import 'package:golf_app/components/partie/generalScore/scoreTable.dart';
import 'package:golf_app/models/interfaces/scoreGeneralModel.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:provider/provider.dart';

class GeneralScore extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => GeneralScore());
  @override
  Widget build(BuildContext context) {
    final partieProvider = Provider.of<PartieProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<ScoreGeneralModel>>(
          future: partieProvider.fetchGeneralScore(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ScoreHeader(),
                    ScoreTable(listOfScores: snapshot.data),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
