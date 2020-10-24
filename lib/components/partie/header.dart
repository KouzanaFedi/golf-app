import 'package:flutter/material.dart';
import 'package:golf_app/models/interfaces/trouModel.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final partieProvider = Provider.of<PartieProvider>(context);
    final TrouModel trou = partieProvider.trous[partieProvider.currentHole];
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          (partieProvider.isFirstHole)
              ? Container(
                  width: 50,
                  height: 50,
                )
              : ClipOval(
                  child: Material(
                    color: Colors.transparent, // button color
                    child: InkWell(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Color(0xFF9AA6AC),
                        ),
                      ),
                      onTap: () {
                        partieProvider.previousHole();
                      },
                    ),
                  ),
                ),
          Column(
            children: [
              Text(
                "Trou ${trou.number}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Color(0xFF9AA6AC),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(text: "Par "),
                    TextSpan(
                      text: "${trou.par} / ",
                      style: TextStyle(
                        color: Color(0xFF4D4D4D),
                      ),
                    ),
                    TextSpan(text: "Hcp "),
                    TextSpan(
                      text: trou.parGir.toString(),
                      style: TextStyle(
                        color: Color(0xFF4D4D4D),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          (partieProvider.isLastHole)
              ? Container(
                  width: 50,
                  height: 50,
                )
              : ClipOval(
                  child: Material(
                    color: Colors.transparent, // button color
                    child: InkWell(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Color(0xFF9AA6AC),
                        ),
                      ),
                      onTap: () {
                        partieProvider.nextHole();
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
