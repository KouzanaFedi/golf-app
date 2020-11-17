import 'package:flutter/material.dart';

class PlayerScoreCard extends StatelessWidget {
  final int order, score;
  final String name, image, type;
  PlayerScoreCard({this.score, this.image, this.name, this.order, this.type});
  Color getColor(ThemeData theme) {
    switch (order) {
      case 1:
        return Color(0xFFFAC559);
        break;
      case 2:
        return Color(0xFF9AA6AC);
      case 3:
        return Color(0xFF00A7D7);
      default:
        return theme.primaryColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
      width: MediaQuery.of(context).size.width * .9,
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: getColor(theme),
                    ),
                    child: CircleAvatar(),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: getColor(theme),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        order.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Text(
            type.toString(),
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF9AA6AC),
            ),
          ),
          Text(
            score.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
