import 'package:flutter/material.dart';

class AnimatedArrow extends StatefulWidget {
  @override
  _AnimatedArrowState createState() => _AnimatedArrowState();
}

class _AnimatedArrowState extends State<AnimatedArrow>
    with SingleTickerProviderStateMixin {
  bool _visible = true;

  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 750),
      vsync: this,
    );

    animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
        setState(() {
          _visible = false;
        });
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
        setState(() {
          _visible = true;
        });
      }
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Opacity(
        opacity: _visible ? 1 : 0,
        child: Container(
          margin: EdgeInsets.only(left: 1, top: 5),
          child: Icon(
            Icons.arrow_drop_down,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }
}
