import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:provider/provider.dart';

class ScoreHeader extends StatelessWidget {
  const ScoreHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BackButton(
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: "Tableau de score\n"),
                  TextSpan(
                    text: "Parcours : Panorama",
                    style: TextStyle(
                      color: Color(0xFF9AA6AC),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            width: 50,
            height: 50,
            alignment: Alignment.center,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${userProvider.user.handicap}\n",
                  ),
                  TextSpan(
                      text: "Hcp",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 8,
                      ))
                ],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
