import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/auth.dart';
import 'package:golf_app/components/animatedLogo.dart';
import 'package:golf_app/components/fullBackground.dart';
import 'package:golf_app/components/tabs/options.dart';
import 'package:golf_app/components/tabs/sac.dart';
import 'package:golf_app/models/interfaces/user.dart';
import 'package:golf_app/utils/custom_icons_icons.dart';

class Acceuil extends StatefulWidget {
  final User user;
  Acceuil({this.user});

  static Route<dynamic> route(User usr) => MaterialPageRoute(
        builder: (context) => Acceuil(
          user: usr,
        ),
      );

  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  User user;
  @override
  void initState() {
    super.initState();
    initUser();
  }

  void initUser() async {
    if (widget.user == null) {
      User temp = await (await Auth.getInstance()).getUser();
      setState(() {
        user = temp;
      });
    } else
      setState(() {
        user = widget.user;
      });
  }

  List<Widget> _list = [Sac(), Text("2"), Text("3"), Options()];
  int _currentIndex = 0;
  final double openHeight = 0, closedHeight = -250;
  double upperHeigt = -250;
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
              children: [
                Center(child: _list[_currentIndex]),
                Positioned(
                  bottom: upperHeigt,
                  right: MediaQuery.of(context).size.width * .075,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * .85,
                    height: 300,
                    child: Column(
                      children: [
                        GestureDetector(
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
                        )
                      ],
                    ),
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
