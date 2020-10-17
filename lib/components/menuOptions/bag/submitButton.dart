import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/golfBagProvider.dart';
import 'package:provider/provider.dart';

class SubmitButton extends StatefulWidget {
  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final golfBag = Provider.of<GolfBagProvider>(context);
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: FlatButton(
        splashColor: Colors.white,
        disabledColor: Colors.grey,
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        onPressed: (golfBag.sacUpdated)
            ? () async {
                setState(() {
                  loading = true;
                });
                await golfBag.submitUpdateSac();
                setState(() {
                  loading = false;
                });
              }
            : null,
        child: Container(
          height: 50,
          width: 220,
          alignment: Alignment.center,
          child: (loading)
              ? Center(
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  ),
                )
              : Text(
                  "Valider",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}
