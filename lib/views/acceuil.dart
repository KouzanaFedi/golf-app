import 'package:flutter/material.dart';
import 'package:golf_app/components/animatedLogo.dart';
import 'package:golf_app/components/fullBackground.dart';
import 'package:golf_app/components/halfBackground.dart';
import 'package:golf_app/components/menu.dart';
import 'package:golf_app/components/navBar.dart';
import 'package:golf_app/components/news/newsDialog.dart';
import 'package:golf_app/components/tabs/general.dart';
import 'package:golf_app/components/tabs/options.dart';
import 'package:golf_app/components/tabs/profile.dart';
import 'package:golf_app/components/tabs/reservation.dart';
import 'package:golf_app/models/interfaces/user.dart';
import 'package:golf_app/models/providers/menuProvider.dart';
import 'package:golf_app/models/providers/reservationProvider.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:golf_app/utils/sharedPref.dart';
import 'package:golf_app/views/partieView.dart';
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
  List<Widget> _list = [General(), Reservation(), Profile(), OptionsTab()];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    UserProvider userProvider = context.read<UserProvider>();
    Future.microtask(() => userProvider.setUser(widget.user));
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    ThemeData theme = Theme.of(context);
    SharedPref.getInstance().then((value) {
      if (value.isGameStartedExists()) {
        Future.delayed(Duration(milliseconds: 2500), () {
          Navigator.of(context).pushReplacement(PartieView.route());
        });
      }
    });

    return SafeArea(
      child: Stack(
        children: [
          menuProvider.currentTabIsReservation
              ? HalfBackground()
              : FullBackground(),
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => ReservationProvider(),
              ),
            ],
            child: Scaffold(
              resizeToAvoidBottomPadding: false,
              backgroundColor: Colors.transparent,
              bottomNavigationBar: NavBar(),
              floatingActionButton: FloatingActionButton(
                splashColor: Colors.white,
                backgroundColor: theme.primaryColor,
                onPressed: () {
                  if (menuProvider.isOpen)
                    menuProvider.closeMenu();
                  else
                    menuProvider.openMenu();
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
                          !menuProvider.currentTabIsProfile
                              ? GestureDetector(
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    margin: EdgeInsets.only(top: 25, left: 25),
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: CircleAvatar(),
                                  ),
                                  onTap: () {
                                    menuProvider.goToProfileTab();
                                  },
                                )
                              : Container(),
                          Container(
                            padding: EdgeInsets.only(right: 15, top: 25),
                            child: ClipOval(
                              child: Material(
                                color: Colors.transparent, // button color
                                child: InkWell(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Icon(
                                      Icons.notifications,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => NewsDialog(),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      RefreshIndicator(
                        color: Colors.white,
                        backgroundColor: theme.primaryColor,
                        strokeWidth: 3,
                        onRefresh: () {
                          return userProvider.refreshPartie();
                        },
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                maxHeight:
                                    MediaQuery.of(context).size.height - 153,
                                minHeight:
                                    MediaQuery.of(context).size.height - 153),
                            child: _list[menuProvider.currentTab],
                          ),
                        ),
                      ),
                    ],
                  ),
                  menuProvider.isOpen && userProvider.havePartie
                      ? Opacity(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.black,
                          ),
                          opacity: .6,
                        )
                      : Container(),
                  (userProvider.havePartie) ? Menu() : Container()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
