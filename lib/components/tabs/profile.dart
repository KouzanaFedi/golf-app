import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/sac.dart';
import 'package:golf_app/components/tabs/profile/addImageButton.dart';
import 'package:golf_app/components/tabs/profile/clubsStats.dart';
import 'package:golf_app/components/tabs/profile/generalStats.dart';
import 'package:golf_app/components/tabs/profile/partieRadar.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:golf_app/views/options.dart';
import 'package:provider/provider.dart';
import 'package:golf_app/api/constants/endPoints.dart';

class Profile extends StatelessWidget {
  Widget subTitle(String title, String value) => Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xFF9AA6AC),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Color(0xFF4D4D4D),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final userProvider = Provider.of<UserProvider>(context);
    ThemeData theme = Theme.of(context);
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: screenSize.width,
                    margin: EdgeInsets.only(top: 60),
                    padding: EdgeInsets.only(
                      top: 60,
                      left: 25,
                      right: 25,
                      bottom: 25,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 25),
                          child: Text(
                            (userProvider.user != null)
                                ? userProvider.user.name
                                : "loading...",
                            style: TextStyle(
                              color: Color(0xFF4D4D4D),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            subTitle(
                                "Départ",
                                userProvider.user != null
                                    ? userProvider.user.depart
                                    : "loading.."),
                            subTitle(
                                "Hcp",
                                userProvider.user != null
                                    ? userProvider.user.handicap.toString()
                                    : "loading.."),
                          ],
                        ),
                        GeneralStats(),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(),
                      AddImageButton(),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        width: 100,
                        height: 100,
                        padding: EdgeInsets.all(2),
                        child: CircleAvatar(
                          child: (userProvider.user.photo == null)
                              ? userProvider.user.loadAssetImage()
                              : ClipOval(
                                  child: Image.network(
                                    "$IMAGE_BASE_URL${userProvider.user.photo}",
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            userProvider.user.loadAssetImage(),
                                  ),
                                ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 35),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          boxShadow: kElevationToShadow[2],
                          shape: BoxShape.circle,
                        ),
                        child: FlatButton(
                          splashColor: Colors.greenAccent,
                          color: theme.primaryColor,
                          shape: CircleBorder(),
                          onPressed: () {
                            Navigator.of(context).push(
                                Options.route(Sac(), "Confirmer Sac de Golf"));
                          },
                          padding: EdgeInsets.all(8),
                          child: Image.asset(
                            "assets/golf_bag_icon.png",
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(),
                    ],
                  )
                ],
              ),
            ),
            PartieRadar(),
            ClubsStats(),
          ],
        ),
      ),
    );
  }
}
