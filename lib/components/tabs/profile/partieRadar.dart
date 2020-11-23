import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:provider/provider.dart';

class PartieRadar extends StatelessWidget {
  final indicators = [
    {"name": "Albatros", "max": 100},
    {"name": "Birdie", "max": 100},
    {"name": "Bogey", "max": 100},
    {"name": "Eagle", "max": 100},
    {"name": "Hole\nIn One", "max": 100},
    {"name": "Tripple\nBogey", "max": 100},
  ];
  final colorsHex = [
    '#f44336',
    '#2196f3',
    '#4caf50',
    '#cddc39',
    '#3f51b5',
    '#ffc107',
  ];

  final colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.indigo,
    Colors.amber,
  ];

  Widget legend(int index, int partie) {
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
            "Partie $partie",
            style: TextStyle(
              color: Color(0xFF4D4D4D),
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }

  Widget generateLegend(List<int> parties) {
    List<Widget> list = [];
    for (var i = 0; i < parties.length; i++) {
      list.add(legend(i, parties[i]));
    }
    return Wrap(
      children: [...list],
      spacing: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final userProvider = Provider.of<UserProvider>(context);
    List<Map<String, dynamic>> statsValues = [];
    List<int> partiesNb = [];
    if (userProvider.gameStats != null && userProvider.gameStats.isNotEmpty) {
      userProvider.gameStats.asMap().forEach((key, element) {
        statsValues.add({
          "value": element.values,
          "areaStyle": {"color": '${colorsHex[key]}', "opacity": 0.5}
        });
        partiesNb.add(element.order);
      });
    }

    return Container(
      width: screenSize.width,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(vertical: 25),
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
          Container(
            margin: EdgeInsets.only(top: 25),
            height: screenSize.width * .75,
            child: Echarts(
              option: '''
                {
                  radar: {
                      name: {
                          textStyle: {
                              color: '#fff',
                              backgroundColor: '#999',
                              borderRadius: 3,
                              padding: [3, 5],
                          }
                      },
                      indicator: ${jsonEncode(indicators)},
                  }, 
                  color: ${jsonEncode(colorsHex)},
                  series: [{
                      type: 'radar',
                      data: ${jsonEncode(statsValues)}
                  }]
              }
              ''',
            ),
          ),
          (partiesNb.isNotEmpty)
              ? Container(
                  child: generateLegend(partiesNb),
                  margin: EdgeInsets.only(top: 15),
                )
              : Container(),
        ],
      ),
    );
  }
}
