import 'package:flutter/material.dart';

class PlayerIcon extends StatelessWidget {
  final String name, image;
  PlayerIcon({this.image, this.name});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final width = (MediaQuery.of(context).size.width - 50) / 3;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              width: 35,
              height: 35,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: theme.primaryColor,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                name,
                softWrap: true,
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xFF9AA6AC),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
