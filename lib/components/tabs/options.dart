import 'package:flutter/material.dart';
import 'package:golf_app/components/logoutButton.dart';
import 'package:golf_app/components/tabs/options/nameEditField.dart';
import 'package:golf_app/components/tabs/options/numberEditField.dart';
import 'package:golf_app/models/providers/optionsProvider.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:golf_app/utils/deviceUtils.dart';
import 'package:provider/provider.dart';

class OptionsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final optionsProvider = Provider.of<OptionsProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.only(top: 25, left: 25, right: 25),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Paramètres",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: optionsProvider.editing
                  ? optionsProvider.loading
                      ? SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(),
                        )
                      : FlatButton.icon(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          disabledTextColor: Colors.grey,
                          onPressed: (optionsProvider.nameError == null &&
                                  optionsProvider.numberError == null)
                              ? () async {
                                  if (optionsProvider.newName != null ||
                                      optionsProvider.newNumber != null) {
                                    optionsProvider.setLoading();
                                    await optionsProvider.updateInfo();
                                    userProvider.updateInfor(
                                        optionsProvider.newName,
                                        optionsProvider.newNumber);
                                    optionsProvider.unSetLoading();
                                  }
                                  optionsProvider.unSetEditing();
                                  DeviceUtils.hideKeyboard(context);
                                }
                              : null,
                          icon: Icon(
                            Icons.check,
                            color: theme.primaryColor,
                          ),
                          label: Text(
                            "Confirmer",
                            style: TextStyle(
                              color: theme.primaryColor,
                            ),
                          ),
                        )
                  : FlatButton.icon(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        optionsProvider.setEditing();
                        DeviceUtils.hideKeyboard(context);
                      },
                      icon: Icon(Icons.edit),
                      label: Text("Modifier"),
                    ),
            ),
            NameEditField(),
            NumberEditField(),
            Container(
              alignment: Alignment.centerRight,
              child: LogOutButton(),
              margin: EdgeInsets.only(top: 25),
            ),
          ],
        ),
      ),
    );
  }
}
