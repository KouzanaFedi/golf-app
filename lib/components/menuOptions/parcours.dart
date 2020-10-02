import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/HoleCard.dart';

class Parcours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          SizedBox(
            height: 330,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 55,
                      ),
                      HoleCard()
                    ],
                  );
                } else if (index == 4) {
                  return Row(
                    children: [
                      HoleCard(),
                      SizedBox(
                        width: 55,
                      ),
                    ],
                  );
                }
                return HoleCard();
              },
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 20,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: FlatButton(
              splashColor: Colors.white,
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              onPressed: () {},
              child: Container(
                height: 50,
                width: 220,
                alignment: Alignment.center,
                child: Text(
                  "Voir map",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
