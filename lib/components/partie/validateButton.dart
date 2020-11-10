import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
import 'package:golf_app/views/scoreHole.dart';
import 'package:provider/provider.dart';

class ValidateButton extends StatefulWidget {
  @override
  _ValidateButtonState createState() => _ValidateButtonState();
}

class _ValidateButtonState extends State<ValidateButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final partieProvider = Provider.of<PartieProvider>(context);
    int holeNb = partieProvider.currentHole;
    int shotNb = partieProvider.currentShot;
    final shot = partieProvider.holePlayed[holeNb].shots[shotNb];

    return FlatButton(
      disabledColor: Colors.grey,
      splashColor: Colors.greenAccent,
      color: theme.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      onPressed: shot.canSubmitShot
          ? () async {
              setState(() {
                loading = true;
              });
              await partieProvider.submitShot();
              setState(() {
                loading = false;
              });

              if (shot.inHole)
                Navigator.of(context).pushReplacement(ScoreHole.route());
            }
          : null,
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
                "Valider coup",
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
