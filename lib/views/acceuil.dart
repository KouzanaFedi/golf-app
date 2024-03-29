import 'package:flutter/material.dart';
import 'package:golf_app/api/constants/endPoints.dart';
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
import 'package:golf_app/models/providers/menuProvider.dart';
import 'package:golf_app/models/providers/reservationProvider.dart';
import 'package:golf_app/models/providers/userProvider.dart';
import 'package:provider/provider.dart';

class Acceuil extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => Acceuil());

  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  List<Widget> _list = [General(), Reservation(), Profile(), OptionsTab()];

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Stack(
        children: [
          menuProvider.currentTabIsReservation ||
                  menuProvider.currentTabIsSettings
              ? HalfBackground()
              : FullBackground(),
          MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => ReservationProvider(),
              ),
            ],
            child: Scaffold(
              resizeToAvoidBottomInset: false,
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
                                    child: CircleAvatar(
                                      child: (userProvider.user != null)
                                          ? userProvider.user.photo == null
                                              ? userProvider.user
                                                  .loadAssetImage()
                                              : ClipOval(
                                                  child: Image.network(
                                                    "$IMAGE_BASE_URL${userProvider.user.photo}",
                                                    width: 45,
                                                    height: 45,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                            error,
                                                            stackTrace) =>
                                                        userProvider.user
                                                            .loadAssetImage(),
                                                  ),
                                                )
                                          : null,
                                    ),
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
                                    MediaQuery.of(context).size.height - 150,
                                minHeight:
                                    MediaQuery.of(context).size.height - 150),
                            child: _list[menuProvider.currentTab],
                          ),
                        ),
                      ),
                    ],
                  ),
                  (menuProvider.isOpen && userProvider.havePartie)
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
