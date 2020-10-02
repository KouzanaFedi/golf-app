import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/joueurs.dart';
import 'package:golf_app/components/menuOptions/parcours.dart';
import 'package:golf_app/components/menuOptions/sac.dart';
import 'package:golf_app/views/options.dart';

class MenuOption extends StatefulWidget {
  final String title, image;
  final int index;
  MenuOption(
      {@required this.title, @required this.image, @required this.index});

  @override
  _MenuOptionState createState() => _MenuOptionState();
}

class _MenuOptionState extends State<MenuOption> {
  bool tappedDown = false;

  void _handleTap(BuildContext context) {
    switch (widget.index) {
      case 0:
        Navigator.of(context).push(Options.route(Sac(), widget.title));
        break;
      case 1:
        Navigator.of(context).push(Options.route(Parcours(), widget.title));
        break;
      case 2:
        Navigator.of(context).push(Options.route(Joueurs(), widget.title));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
            color: (tappedDown) ? theme.primaryColor : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.image,
              height: 45,
              color: (tappedDown) ? Colors.white : theme.primaryColor,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 12,
                  color: (tappedDown) ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      onTapUp: (details) {
        setState(() {
          tappedDown = false;
          _handleTap(context);
        });
      },
      onTapDown: (details) {
        setState(() {
          tappedDown = true;
        });
      },
      onTapCancel: () {
        setState(() {
          tappedDown = false;
        });
      },
    );
  }
}
