import 'package:flutter/material.dart';
import 'package:golf_app/api/constants/endPoints.dart';

class PlayerIcon extends StatelessWidget {
  final String name, image, sexe;
  PlayerIcon({this.image, this.name, this.sexe});
  Image loadAssetImage(String gender) {
    if (gender == "femme")
      return Image.asset("assets/player-f.png");
    else
      return Image.asset("assets/player-m.png");
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
              child: CircleAvatar(
                child: image == null
                    ? loadAssetImage(sexe)
                    : ClipOval(
                        child: Image.network(
                          "$IMAGE_BASE_URL$image",
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              loadAssetImage(sexe),
                        ),
                      ),
              ),
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
