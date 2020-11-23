import 'dart:math';

import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/ressource.dart';
import 'package:golf_app/models/interfaces/weatherModel.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:golf_app/utils/custom_icons_icons.dart';
import 'package:provider/provider.dart';

class MetaInfo extends StatelessWidget {
  String getDay(int d) {
    switch (d) {
      case 1:
        return "Lundi";
        break;
      case 2:
        return "Mardi";
        break;
      case 3:
        return "Mercredi";
        break;
      case 4:
        return "Jeudi";
        break;
      case 5:
        return "Vendredi";
        break;
      case 6:
        return "Samedi";
        break;
      default:
        return "Dimanche";
        break;
    }
  }

  String getMonth(int d) {
    switch (d) {
      case 1:
        return "jan";
        break;
      case 2:
        return "fév";
        break;
      case 3:
        return "mar";
        break;
      case 4:
        return "avr";
        break;
      case 5:
        return "mai";
        break;
      case 6:
        return "jui";
        break;
      case 7:
        return "jui";
        break;
      case 8:
        return "aoû";
        break;
      case 9:
        return "sep";
        break;
      case 10:
        return "oct";
        break;
      case 11:
        return "nov";
        break;
      default:
        return "déc";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final partieProvider = Provider.of<PartieProvider>(context, listen: false);
    return Container(
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
    );
  }
}
