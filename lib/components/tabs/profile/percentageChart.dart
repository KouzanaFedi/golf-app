import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class PercentageChart extends StatelessWidget {
  final double value, width;
  final String title;
  PercentageChart({this.title, this.value, this.width});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        (value != 0.0)
            ? AnimatedCircularChart(
                edgeStyle: SegmentEdgeStyle.round,
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
              )
            : AnimatedCircularChart(
                edgeStyle: SegmentEdgeStyle.round,
                chartType: CircularChartType.Radial,
                percentageValues: true,
                size: Size(width, width),
                duration: Duration(milliseconds: 1500),
                holeLabel: "$value%",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 15 * (width / 80),
                  fontWeight: FontWeight.w600,
                ),
                initialChartData: [
                  CircularStackEntry(
                    [
                      CircularSegmentEntry(
                        100,
                        Colors.grey,
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
  }
}
