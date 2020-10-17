import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/reservationProvider.dart';
import 'package:provider/provider.dart';

class LocationItemCard extends StatefulWidget {
  final int id;
  final String name;

  LocationItemCard({@required this.id, @required this.name});

  @override
  _LocationItemCardState createState() => _LocationItemCardState();
}

class _LocationItemCardState extends State<LocationItemCard> {
  bool loading = false;

  final List<String> listOfAssets = [
    "golf_bag3.png",
    "golf_bag.png",
    "golf_ball.png",
    "golf_bag.png",
    "golf_bag2.png",
    "voiturette2.png"
  ];

  @override
  Widget build(BuildContext context) {
    final reservationProvider = Provider.of<ReservationProvider>(context);
    bool reserved = reservationProvider.alreadyLocated(widget.id);
    return Container(
      width: 145,
      height: 115,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 5, top: 5),
            width: 140,
            height: 110,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: (reserved) ? Colors.blueGrey[50] : Colors.white,
              border: Border.all(color: Color(0xFFEEEEEE)),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/${listOfAssets[(widget.id - 1) % listOfAssets.length]}",
                  scale: 1.25,
                ),
                Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF4D4D4D), fontSize: 10),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: (reserved)
                ? ClipOval(
                    child: Material(
                      color:
                          (loading) ? Colors.grey : Colors.red, // button color
                      child: InkWell(
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                        onTap: () async {
                          if (!loading) {
                            setState(() {
                              loading = true;
                            });
                            reservationProvider.deleteLocation(widget.id);
                            setState(() {
                              loading = false;
                            });
                          }
                        },
                      ),
                    ),
                  )
                : ClipOval(
                    child: Material(
                      color: (loading)
                          ? Colors.grey
                          : Theme.of(context).primaryColor, // button color
                      child: InkWell(
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                        onTap: () async {
                          if (!loading) {
                            setState(() {
                              loading = true;
                            });
                            reservationProvider.addLocation(widget.id);
                            setState(() {
                              loading = false;
                            });
                          }
                        },
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
