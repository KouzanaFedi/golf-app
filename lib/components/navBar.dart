import 'package:flutter/material.dart';
import 'package:golf_app/models/providers/menuProvider.dart';
import 'package:golf_app/utils/custom_icons_icons.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    ThemeData theme = Theme.of(context);

    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipOval(
            child: Material(
              color: Colors.transparent, // button color
              child: InkWell(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(
                    CustomIcons.golf_ball,
                    color: menuProvider.currentTabIsHome
                        ? theme.primaryColor
                        : Colors.grey,
                  ),
                ),
                onTap: () {
                  menuProvider.goToHomeTab();
                },
              ),
            ),
          ),
          ClipOval(
            child: Material(
              color: Colors.transparent, // button color
              child: InkWell(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(
                    CustomIcons.calendar,
                    color: menuProvider.currentTabIsReservation
                        ? theme.primaryColor
                        : Colors.grey,
                  ),
                ),
                onTap: () {
                  menuProvider.goToReservationTab();
                },
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: 50,
          ),
          ClipOval(
            child: Material(
              color: Colors.transparent, // button color
              child: InkWell(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(
                    CustomIcons.user,
                    color: menuProvider.currentTabIsProfile
                        ? theme.primaryColor
                        : Colors.grey,
                  ),
                ),
                onTap: () {
                  menuProvider.goToProfileTab();
                },
              ),
            ),
          ),
          ClipOval(
            child: Material(
              color: Colors.transparent, // button color
              child: InkWell(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(
                    CustomIcons.cog,
                    color: menuProvider.currentTabIsSettings
                        ? theme.primaryColor
                        : Colors.grey,
                  ),
                ),
                onTap: () {
                  menuProvider.goToSettingsTab();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
