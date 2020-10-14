import 'package:flutter/material.dart';
import 'package:golf_app/models/interfaces/club.dart';
import 'package:golf_app/models/providers/golfBagProvider.dart';
import 'package:provider/provider.dart';

class ClubCard extends StatelessWidget {
  final Club club;

  ClubCard({@required this.club});

  @override
  Widget build(BuildContext context) {
    final golfSac = Provider.of<GolfBagProvider>(context);
    bool exists = golfSac.alreadyHave(club);
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10, top: 12, left: 12),
          width: 75,
          height: 100,
          decoration: BoxDecoration(
            color: exists ? Colors.grey : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                club.clubHeadAsset,
                height: 45,
                width: 45,
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  club.nom,
                  style: TextStyle(
                    color: exists ? Colors.white : Color(0xFF9AA6AC),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              (club.distance != null)
                  ? Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        "${club.distance} métres",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
        (!exists)
            ? Container()
            : Padding(
                padding: EdgeInsets.only(top: 6, left: 6),
                child: ClipOval(
                  child: Material(
                    color: Colors.red, // button color
                    child: InkWell(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      onTap: () {
                        golfSac.deleteFromMyClubs(club);
                      },
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
