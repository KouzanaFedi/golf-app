import 'package:flutter/material.dart';
import 'package:golf_app/components/animatedLogo.dart';
import 'package:golf_app/components/fullBackground.dart';
import 'package:golf_app/components/menuOptions/joueurs.dart';
import 'package:golf_app/components/menuOptions/menuOptions.dart';
import 'package:golf_app/components/menuOptions/parcours.dart';
import 'package:golf_app/components/menuOptions/sac.dart';
import 'package:golf_app/components/tabs/options.dart';
import 'package:golf_app/components/tabs/profile.dart';
import 'package:golf_app/models/interfaces/user.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:golf_app/utils/custom_icons_icons.dart';
import 'package:provider/provider.dart';

class Acceuil extends StatefulWidget {
  final User user;
  Acceuil({this.user});
  static Route<dynamic> route(User usr) => MaterialPageRoute(
      builder: (context) => Acceuil(
            user: usr,
          ));

  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  List<Widget> _list = [Text("1"), Text("2"), Profile(), OptionsTab()];
  int _currentIndex = 2;
  final double menuHeight = 400;

  final double openHeight = 0, closedHeight = -350;
  double upperHeigt = -350;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.microtask(() => context.read<UserProvider>().setUser(widget.user));
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Widget> listOfTabs = [
      ClipOval(
        child: Material(
          color: Colors.transparent, // button color
          child: InkWell(
            child: SizedBox(
              width: 50,
              height: 50,
              child: Icon(
                CustomIcons.golf_ball,
                color: (_currentIndex == 0) ? theme.primaryColor : Colors.grey,
              ),
            ),
            onTap: () {
              if (_currentIndex != 0) {
                setState(() {
                  _currentIndex = 0;
                });
              }
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
                color: (_currentIndex == 1) ? theme.primaryColor : Colors.grey,
              ),
            ),
            onTap: () {
              if (_currentIndex != 1) {
                setState(() {
                  _currentIndex = 1;
                });
              }
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
                color: (_currentIndex == 2) ? theme.primaryColor : Colors.grey,
              ),
            ),
            onTap: () {
              if (_currentIndex != 2) {
                setState(() {
                  _currentIndex = 2;
                });
              }
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
                color: (_currentIndex == 3) ? theme.primaryColor : Colors.grey,
              ),
            ),
            onTap: () {
              if (_currentIndex != 3) {
                setState(() {
                  _currentIndex = 3;
                });
              }
            },
          ),
        ),
      ),
    ];
    double menuWidth = MediaQuery.of(context).size.width * .95;

    return SafeArea(
      child: Stack(
        children: [
          FullBackground(),
          Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.transparent,
            bottomNavigationBar: BottomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [...listOfTabs],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              splashColor: Colors.white,
              backgroundColor: theme.primaryColor,
              onPressed: () {
                if (upperHeigt == closedHeight)
                  setState(() {
                    upperHeigt = openHeight;
                  });
                else
                  setState(() {
                    upperHeigt = closedHeight;
                  });
              },
              child: AnimatedLogo(
                width: 30,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        (_currentIndex != 2)
                            ? GestureDetector(
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  margin: EdgeInsets.only(top: 10, left: 10),
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: CircleAvatar(),
                                ),
                                onTap: () {
                                  setState(() {
                                    _currentIndex = 2;
                                  });
                                },
                              )
                            : Container(),
                        Container(
                          padding: EdgeInsets.only(right: 10, top: 10),
                          child: ClipOval(
                            child: Material(
                              color: Colors.transparent, // button color
                              child: InkWell(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(
                                    Icons.notifications_none,
                                    color: Colors.white,
                                  ),
                                ),
                                onTap: () {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: _list[_currentIndex]),
                  ],
                ),
                (upperHeigt == openHeight)
                    ? Opacity(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black,
                        ),
                        opacity: .6,
                      )
                    : Container(),
                Positioned(
                  bottom: upperHeigt,
                  right: MediaQuery.of(context).size.width * .025,
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: (upperHeigt == closedHeight) ? 1 : .8,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: (upperHeigt == closedHeight)
                                ? kElevationToShadow[6]
                                : null,
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          width: menuWidth,
                          height: menuHeight,
                          alignment: Alignment.topCenter,
                          child: GestureDetector(
                            child: Icon(
                              (upperHeigt == closedHeight)
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: Color(0xFF9AA6AC),
                            ),
                            onTap: () {
                              setState(() {
                                upperHeigt = closedHeight;
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: menuHeight,
                        width: menuWidth,
                        padding: EdgeInsets.all(40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                "Votre partie est prévu pour le mardi 07 septembre à 17h",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MenuOption(
                                  title: "Confirmer Sac de Golf",
                                  image: "assets/golf_bag_icon.png",
                                  child: Sac(),
                                ),
                                MenuOption(
                                  title: "Liste des parcours",
                                  image: "assets/hole_icon1.png",
                                  child: Parcours(),
                                )
                              ],
                            ),
                            MenuOption(
                              title: "Liste des joueurs",
                              image: "assets/player.png",
                              child: Joueurs(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
