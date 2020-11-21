import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/partieProvider.dart';
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
          ? () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  title: Text("Jouer coup ${shotNb + 1} du trou ${holeNb + 1}"),
                  content: Text(
                      "Batton : ${partieProvider.getClubName(shot.clubId)}\nMise en jeu : ${partieProvider.getMethodName(shot.methodId)}\nPinalité : ${(shot.penality) ? 'Vrai' : 'Faux'}\nSand save : ${(shot.sandSave) ? 'Vrai' : 'Faux'}\nBalle dans le trou : ${(shot.inHole) ? 'Vrai' : 'Faux'}"),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Annuler"),
                      textColor: Colors.grey,
                    ),
                    FlatButton(
                      onPressed: () async {
                        int count = 0;
                        setState(() {
                          loading = true;
                        });
                        bool rep = await partieProvider.submitShot();
                        setState(() {
                          loading = false;
                        });
                        if (rep) {
                          partieProvider.setSendWithDelay(shot);
                          Navigator.of(context)
                              .popUntil((route) => count++ >= 2);
                        } else {
                          Navigator.of(context).pop();
                          partieProvider.setSendWithOutDelay(shot);
                        }
                      },
                      child: Text('Continuer'),
                    ),
                  ],
                ),
              );
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
