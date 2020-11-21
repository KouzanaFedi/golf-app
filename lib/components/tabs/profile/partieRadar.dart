import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

class PartieRadar extends StatelessWidget {
  final ticks = [20, 40, 60, 80, 100];
  final data = [
    [15, 20, 0, 55, 6, 82]
  ];

  final features = [
    "Albatros",
    "Birdie",
    "Bogey",
    "Eagle",
    "Hole In One",
    "Tripple Bogey"
  ];
  final colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.indigo,
    Colors.amber,
  ];

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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
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
                sides: features.length,
                graphColors: colors,
              ),
            ),
          ),
          generateLegend(),
        ],
      ),
    );
  }
}
