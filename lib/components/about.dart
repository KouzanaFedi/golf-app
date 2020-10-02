import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final List<String> services = [
    "9 trous",
    "18 trous",
    "Voiturette",
    "Restaurant"
  ];

  List<Widget> serviceList() {
    List<Widget> list = [];
    for (var service in services) {
      String imagePath =
          "assets/${service.replaceAll(' ', '_').toLowerCase()}.png";
      list.add(ServiceIcon(
        title: service,
        imagePath: imagePath,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size screenSize = MediaQuery.of(context).size;
    TextStyle titleStyle = TextStyle(
      color: theme.primaryColor,
      fontSize: 17,
    );
    double paddingBetweenItems = 15;

    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 25, left: 25, right: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: paddingBetweenItems),
                  child: Text("A propos", style: titleStyle),
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer quis arcu tortor. Vivamus condimentum rhoncus massa, sed aliquam dui euismod eget. Quisque efficitur non tellus et gravida. Nunc vel varius nulla. Praesent suscipit, massa quis efficitur convallis, lorem tortor elementum urna, sed molestie metus mauris nec lectus. Nunc vitae est massa. Etiam urna est, fermentum eu lorem ullamcorper, varius scelerisque erat. Duis et est vel tellus imperdiet faucibus in nec mauris. Suspendisse at varius mauris. Praesent diam justo, luctus sit amet pellentesque non, facilisis sit amet massa. Morbi velit nulla, hendrerit ut suscipit quis, varius id nibh.",
                  style: TextStyle(
                    color: theme.textSelectionColor,
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: paddingBetweenItems, bottom: paddingBetweenItems),
                  child: Text("Services", style: titleStyle),
                ),
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [...serviceList()]),
                Container(
                  padding: EdgeInsets.only(
                      top: paddingBetweenItems, bottom: paddingBetweenItems),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Voir plus de services",
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: paddingBetweenItems),
                  child: Text("Contactez nous", style: titleStyle),
                ),
                FlatButton(
                  splashColor: Colors.greenAccent,
                  color: theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  onPressed: () => {},
                  child: Container(
                    width: screenSize.width * .8,
                    alignment: Alignment.center,
                    child: Text(
                      "CONTACTEZ NOUS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ServiceIcon extends StatelessWidget {
  final String title, imagePath;
  ServiceIcon({@required this.title, @required this.imagePath});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double wh = 50;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5),
              width: wh,
              height: wh,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.textSelectionColor,
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Image.asset(
                imagePath,
              ),
            ),
          ],
        ),
        Text(
          title,
          style: TextStyle(
            color: theme.textSelectionColor,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
