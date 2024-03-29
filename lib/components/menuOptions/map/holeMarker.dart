import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/map/animatedArrow.dart';
import 'package:golf_app/models/providers/trousProvider.dart';
import 'package:provider/provider.dart';

class HoleMarker extends StatefulWidget {
  final int order, currentHole;
  HoleMarker({this.order, this.currentHole});
  @override
  _HoleMarkerState createState() => _HoleMarkerState();
}

class _HoleMarkerState extends State<HoleMarker> {
  Color markerColor() {
    return (widget.order == widget.currentHole)
        ? Colors.red
        : Colors.blueAccent[400];
  }

  Widget playingHole() {
    Widget arrow = AnimatedArrow();
    return (widget.order == widget.currentHole) ? arrow : Container();
  }

  @override
  Widget build(BuildContext context) {
    final trouProvider = Provider.of<TrouProvider>(context, listen: false);

    return Stack(
      children: <Widget>[
        playingHole(),
        Positioned(
          top: 24,
          child: ClipOval(
            child: Material(
              elevation: 15,
              shadowColor: Colors.grey,
              color: markerColor(), // button color
              child: InkWell(
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: Center(
                    child: Text(
                      widget.order.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  trouProvider.setPage(widget.order);
                  trouProvider.set2DView();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
