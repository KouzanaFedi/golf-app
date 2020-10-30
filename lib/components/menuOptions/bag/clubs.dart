import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/bag/clubCard.dart';
import 'package:golf_app/models/interfaces/club.dart';
import 'package:golf_app/models/providers/golfBagProvider.dart';
import 'package:provider/provider.dart';

class Clubs extends StatelessWidget {
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final golfBag = Provider.of<GolfBagProvider>(context);
    List<Club> availableClubs = golfBag.availableClubs;
    final theme = Theme.of(context);
    ThemeData _scrollBarTheme =
        Theme.of(context).copyWith(highlightColor: theme.primaryColor);
    return Container(
      width: 100,
      child: Theme(
        data: _scrollBarTheme,
        child: Scrollbar(
          isAlwaysShown: true,
          controller: scrollController,
          child: ListView.builder(
            itemCount: availableClubs.length,
            itemBuilder: (context, index) {
              if (golfBag.alreadyHave(availableClubs[index]))
                return ClubCard(club: availableClubs[index]);
              else
                return Draggable<Club>(
                  affinity: Axis.horizontal,
                  data: availableClubs[index],
                  feedback: Image.asset(
                    availableClubs[index].clubLongAsset,
                    scale: 1.25,
                  ),
                  childWhenDragging: Container(
                    margin: EdgeInsets.only(
                        bottom: 10, top: 12, left: 12, right: 12),
                    width: 75,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: ClubCard(club: availableClubs[index]),
                );
            },
            controller: scrollController,
            physics: BouncingScrollPhysics(),
          ),
        ),
      ),
    );
  }
}
