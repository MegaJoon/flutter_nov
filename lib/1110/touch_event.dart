import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TouchEvent extends StatefulWidget {
  @override
  _TouchEventState createState() => _TouchEventState();
}

class _TouchEventState extends State<TouchEvent> with TickerProviderStateMixin {
  // animate
  Animation animation;
  AnimationController animationController;

  //
  bool isSelected = false;
  double positionX;
  double positionY;

  _onTapUp(TapUpDetails details) {
    positionX = details.globalPosition.dx;
    positionY = details.globalPosition.dy;
  }

  _onTapDown(TapDownDetails details) {
    positionX = details.globalPosition.dx;
    positionY = details.globalPosition.dy;
  }

  _playAnimate(){
    isSelected = !isSelected;
    isSelected? animationController.forward(): null;
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: 200), vsync: this);

    animation = Tween<double>(begin: 0, end: 150).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
//          animationController.reverse();
          isSelected = !isSelected;
          animationController.reset();
        }
      })
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              isSelected? Positioned(
                      top: positionY - 100.0 - animation.value,
                      left: positionX - 200.0 / 2,
                      child: Container(
                        height: 100.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.teal),
                        child: Center(
                          child: Icon(Icons.favorite,
                              size: 40.0, color: Colors.pinkAccent),
                        ),
                      ),
                    ): Container(),
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                print(positionX.toString() + " / " + positionY.toString());
                _playAnimate();
              });
            },
            onTapUp: (TapUpDetails details) => _onTapUp(details),
            onTapDown: (TapDownDetails details) => _onTapDown(details),
          ),
        ],
      ),
    );
  }
}
