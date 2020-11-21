import 'package:flutter/material.dart';
import 'package:golf_app/components/tabs/profile/percentageChart.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:provider/provider.dart';

class GeneralStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double chartWidth = ((screenSize.width - 90) * .9) / 4;
    final userProvider = Provider.of<UserProvider>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PercentageChart(
                value: userProvider.stats == null
                    ? 0.0
                    : userProvider.stats.fairway,
                width: chartWidth,
                title: "Fairway",
              ),
              PercentageChart(
                value:
                    userProvider.stats == null ? 0.0 : userProvider.stats.gir,
                width: chartWidth,
                title: "GIR",
              ),
              PercentageChart(
                value:
                    userProvider.stats == null ? 0.0 : userProvider.stats.puts,
                width: chartWidth,
                title: "Puts",
              ),
              PercentageChart(
                value: userProvider.stats == null ? 0.0 : userProvider.stats.ss,
                width: chartWidth,
                title: "SS",
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SubTitle2(
              title: "Driving Accuracy",
              value: (userProvider.stats == null)
                  ? 0.0
                  : userProvider.stats.drivingAcc,
              unity: "mm",
            ),
            SubTitle2(
              title: "Greens In regulation",
              value: (userProvider.stats == null)
                  ? 0.0
                  : userProvider.stats.greensInReg,
              unity: "%",
            ),
            SubTitle2(
              title: "Putting Average",
              value: (userProvider.stats == null)
                  ? 0.0
                  : userProvider.stats.puttingAverage,
            ),
            SubTitle2(
              title: "Sand Saves",
              value: (userProvider.stats == null)
                  ? 0.0
                  : userProvider.stats.sandSaves,
              unity: "%",
            ),
          ],
        )
      ],
    );
  }
}

class SubTitle2 extends StatelessWidget {
  final String title, unity;
  final double value;
  SubTitle2({this.title, this.value, this.unity});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            "$value${(unity != null) ? unity : ''}",
            style: TextStyle(
              color: Color(0xFF4D4D4D),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 90) / 4,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF9AA6AC),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            softWrap: true,
          ),
        )
      ],
    );
  }
}
