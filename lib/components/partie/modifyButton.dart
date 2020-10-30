import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:provider/provider.dart';

class ModifyButton extends StatefulWidget {
  @override
  _ModifyButtonState createState() => _ModifyButtonState();
}

class _ModifyButtonState extends State<ModifyButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final partieProvider = Provider.of<PartieProvider>(context);
    int holeNb = partieProvider.currentHole;
    int shotNb = partieProvider.currentShot;
    final shot = partieProvider.holePlayed[holeNb].shots[shotNb];

    return FlatButton(
      disabledColor: Colors.grey,
      splashColor: Colors.yellow,
      color: Colors.amber[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      onPressed: shot.canModifyShot ? () async {} : null,
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        alignment: Alignment.center,
        child: (loading)
            ? Center(
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(),
                ),
              )
            : Text(
                "Modifier coup",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}
