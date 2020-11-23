import 'package:flutter/material.dart';
import 'package:golf_app/api/constants/endPoints.dart';
import 'package:golf_app/models/interfaces/joueur.dart';

class PlayerBar extends StatelessWidget {
  final Joueur joueur;
  PlayerBar({this.joueur});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 65,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    child: joueur.photo == null
                        ? joueur.loadAssetImage()
                        : ClipOval(
                            child: Image.network(
                              "$IMAGE_BASE_URL${joueur.photo}",
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  joueur.loadAssetImage(),
                            ),
                          ),
                  ),
                ),
                Container(
                  width: 100,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    joueur.name,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Row(
              children: [
                Text(
                  "Hcp",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    joueur.handicap,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
