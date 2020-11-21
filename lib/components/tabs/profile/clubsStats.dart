import 'package:flutter/material.dart';
import 'package:golf_app/components/tabs/profile/percentageChart.dart';
import 'package:golf_app/models/interfaces/club.dart';
import 'package:golf_app/models/interfaces/clubStat.dart';
import 'package:golf_app/models/providers/golfBagProvider.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:provider/provider.dart';

class ClubsStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final golfBagProvider = Provider.of<GolfBagProvider>(context);

    List<ClubStat> listOfStats = userProvider.clubStats;
    List<Club> listOfClubs = golfBagProvider.availableClubs;

    List<ClubRow> listOfRows = [];
    if (listOfClubs != null && listOfStats != null) {
      if (listOfStats.isNotEmpty) {
        listOfStats.forEach((element) {
          Club club = listOfClubs.singleWhere(
            (club) => club.id == element.id,
            orElse: null,
          );
          listOfRows.add(ClubRow(club: club, value: element.perscentage));
        });
      }
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 20, bottom: 60),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            "Clubs les plus joués",
            style: TextStyle(
              color: Color(0xFF4D4D4D),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: listOfRows.isNotEmpty
                ? Column(
                    children: listOfRows,
                  )
                : Center(
                    child: Text(
                      "Vous n'avez joué aucune partie.",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class ClubRow extends StatelessWidget {
  final Club club;
  final double value;

  ClubRow({this.club, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: kElevationToShadow[4],
              ),
              padding: EdgeInsets.all(10),
              child: Image.asset(
                club.clubHeadAsset,
              ),
            ),
            Text(
              club.nom,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4D4D4D),
              ),
            )
          ],
        ),
        PercentageChart(
          value: value,
          width: 80,
        ),
      ],
    );
  }
}
