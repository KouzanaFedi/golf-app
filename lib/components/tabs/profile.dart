import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:golf_app/utils/custom_icons_icons.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  final ticks = [7, 14, 21, 28, 35];
  final features = [
    "Title 1",
    "Title 2",
    "Title 3",
    "Title 4",
    "Title 5",
    "Title 6"
  ];
  final colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.indigo,
    Colors.amber,
  ];

  final data = [
    [10, 20, 28, 5, 16, 15],
    [15, 1, 4, 14, 23, 10],
    [34, 0, 9, 22, 2, 15],
    [14, 23, 10, 14, 23, 10],
    [15, 0, 9, 22, 23, 10],
    [5, 16, 15, 4, 23, 10],
  ];

  Widget generateLegend() {
    List<Widget> list = [];
    for (var i = 0; i < features.length; i++) {
      list.add(legend(i));
    }
    return Wrap(
      children: [...list],
      spacing: 10,
    );
  }

  Widget legend(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 5,
          width: 35,
          decoration: BoxDecoration(
            color: colors[index],
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            features[index],
            style: TextStyle(
              color: Color(0xFF4D4D4D),
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }

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

  Widget subTitle2(String title, String value) => Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              value,
              style: TextStyle(
                color: Color(0xFF4D4D4D),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF9AA6AC),
              fontSize: 8,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      );

  Widget percentageChart(ThemeData theme, double value, double width,
          {String title}) =>
      Column(
        children: [
          AnimatedCircularChart(
            chartType: CircularChartType.Radial,
            percentageValues: true,
            size: Size(width, width),
            duration: Duration(milliseconds: 1500),
            holeLabel: "$value%",
            labelStyle: TextStyle(
              color: theme.primaryColor,
              fontSize: 15 * (width / 80),
              fontWeight: FontWeight.w600,
            ),
            initialChartData: [
              CircularStackEntry(
                [
                  CircularSegmentEntry(
                    value,
                    theme.primaryColor,
                  ),
                ],
              )
            ],
          ),
          (title != null)
              ? Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "% $title",
                    style: TextStyle(
                      fontSize: 13 * (width / 70),
                      color: Color(0xFF9AA6AC),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : Container(),
        ],
      );

  Widget clubRow(ThemeData theme, String club, double value) => Row(
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
                  "assets/clubs/${club.toLowerCase()}_head.png",
                ),
              ),
              Text(
                club,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4D4D4D),
                ),
              )
            ],
          ),
          percentageChart(theme, value, 80),
        ],
      );

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final userProvider = Provider.of<UserProvider>(context);
    double chartWidth = ((screenSize.width - 90) * .9) / 4;
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
                            subTitle("Niveau", "Apprenti"),
                            subTitle("Hcp", "45"),
                            subTitle("Club", "Putter")
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              percentageChart(theme, 51, chartWidth,
                                  title: "Fairway"),
                              percentageChart(theme, 78, chartWidth,
                                  title: "GIR"),
                              percentageChart(theme, 29, chartWidth,
                                  title: "Puts"),
                              percentageChart(theme, 69, chartWidth,
                                  title: "Gir"),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            subTitle2("Driver", "224mm"),
                            subTitle2("Dispo.BdG", "29.4%"),
                            subTitle2("Cps.Perdus", "8.7"),
                            subTitle2("Disp.BdG", "29.4%"),
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(),
                      Container(
                        margin: EdgeInsets.only(top: 35),
                        width: 50,
                        height: 50,
                        child: FlatButton(
                          splashColor: Colors.greenAccent,
                          color: theme.primaryColor,
                          shape: CircleBorder(),
                          onPressed: () {},
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            CustomIcons.user_plus,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          width: 100,
                          height: 100,
                          padding: EdgeInsets.all(2),
                          child: CircleAvatar(
                              // backgroundImage: NetworkImage(
                              //   "https://club-house-api.herokuapp.com/uploads/users/1602018271.jpeg",
                              // ),
                              )
                          //  (user.photo != null)?

                          // :
                          //     Image(
                          //         image: AssetImage(
                          //   "assets/player.png",
                          // )),

                          ),
                      Container(
                        margin: EdgeInsets.only(top: 35),
                        width: 50,
                        height: 50,
                        child: FlatButton(
                          splashColor: Colors.greenAccent,
                          color: theme.primaryColor,
                          shape: CircleBorder(),
                          onPressed: () {},
                          padding: EdgeInsets.all(5),
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
            Container(
              width: screenSize.width,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Statistique",
                    style: TextStyle(
                      color: Color(0xFF4D4D4D),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: SizedBox(
                      width: screenSize.width * .75,
                      height: screenSize.width * .75,
                      child: RadarChart(
                          featuresTextStyle: TextStyle(
                            color: Color(0xFF9AA6AC),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          ticksTextStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          outlineColor: Colors.grey,
                          ticks: ticks,
                          features: features,
                          data: data,
                          reverseAxis: true,
                          sides: features.length,
                          graphColors: colors
                          //useSides: true,
                          ),
                    ),
                  ),
                  generateLegend(),
                ],
              ),
            ),
            Container(
              width: screenSize.width,
              margin: EdgeInsets.only(top: 20, bottom: 60),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Text(
                    "Most played club",
                    style: TextStyle(
                      color: Color(0xFF4D4D4D),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        clubRow(theme, "Fairway", 51),
                        clubRow(theme, "Hybrid", 24),
                        clubRow(theme, "Wedge", 11),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
