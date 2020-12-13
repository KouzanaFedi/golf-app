import 'dart:math';

import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/ressource.dart';
import 'package:golf_app/models/interfaces/weatherModel.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:golf_app/utils/custom_icons_icons.dart';
import 'package:provider/provider.dart';

class MetaInfo extends StatelessWidget {
  String getDay(int d) {
    List<String> days = [
      "Lundi",
      "Mardi",
      "Mercredi",
      "Jeudi",
      "Vendredi",
      "Samedi",
      "Dimanche"
    ];
    return days[d - 1];
  }

  String getMonth(int d) {
    List<String> months = [
      "jan",
      "fév",
      "mar",
      "avr",
      "mai",
      "jui",
      "jui",
      "aoû",
      "sep",
      "oct",
      "nov",
      "déc"
    ];
    return months[d - 1];
  }

  @override
  Widget build(BuildContext context) {
    final partieProvider = Provider.of<PartieProvider>(context, listen: false);
    return GestureDetector(
      onTap: () => partieProvider.clearGame(),
      child: Container(
        margin: EdgeInsets.only(top: 20),
        width: 300,
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: kElevationToShadow[2],
        ),
        child: FutureBuilder<WeatherModerl>(
          future: Ressource.getInstance().fetchWeather(),
          builder: (context, snapshot) {
            DateTime date = DateTime.now();
            if (snapshot.connectionState == ConnectionState.done) {
              final weather = snapshot.data;
              String weatherIcon = "https:${weather.icon}";
              return Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(text: "${getDay(date.weekday)}\n"),
                          TextSpan(
                            text:
                                "${date.day} ${getMonth(date.month)} ${date.year}",
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(
                                0xFF9AA6AC,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Image.network(
                            weatherIcon,
                          ),
                          Text(
                            "${weather.temp.round()}°",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Transform.rotate(
                          angle: -weather.windDegre * (pi / 180),
                          child: Icon(CustomIcons.long_arrow_alt_right),
                        ),
                        Text(
                          "${weather.windSpeed}km/h",
                          style: TextStyle(
                            color: Color(0xFF9AA6AC),
                            fontSize: 11,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
