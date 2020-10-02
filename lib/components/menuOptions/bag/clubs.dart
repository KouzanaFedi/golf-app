import 'package:flutter/material.dart';
import 'package:golf_app/components/menuOptions/bag/club.dart';
import 'package:golf_app/models/providers/golfBagProvider.dart';
import 'package:provider/provider.dart';

class Clubs extends StatelessWidget {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final golfBag = Provider.of<GolfBagProvider>(context);
    List<int> availableClubs = golfBag.availableClubs;
    return Container(
      width: 100,
      child: Scrollbar(
        isAlwaysShown: true,
        controller: scrollController,
        child: ListView.builder(
          itemCount: availableClubs.length,
          itemBuilder: (context, index) {
            if (golfBag.alreadyHave(availableClubs[index]))
              return Club(index: availableClubs[index]);
            else
              return Draggable<int>(
                data: availableClubs[index],
                feedback: Material(
                  color: Colors.transparent,
                  child: Club(
                    index: availableClubs[index],
                    context: context,
                  ),
                ),
                childWhenDragging: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Club(index: availableClubs[index]),
              );
          },
          controller: scrollController,
          physics: BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
