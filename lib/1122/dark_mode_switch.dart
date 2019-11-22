import 'dart:math';

import 'package:flutter/material.dart';

// https://dribbble.com/shots/6844698-Dark-theme-switch-animation

class DarkModeSwitch extends StatefulWidget {
  @override
  _DarkModeSwitchState createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  // color list
  Color _backgroundColor = Color.fromRGBO(39, 23, 58, 1);
  Color _containerColor = Color.fromRGBO(255, 194, 7, 1);

  // border.radius value
  double _radius = 64.0;
  //
  double padding = 12.0;
  double positionX = 12.0;  // initial position == padding;
  double btnWidth;
  double maxPosition;
  double percent = 0.0;  // == ratio == positionX / maxPostion

  @override
  Widget build(BuildContext context) {
    // button width
    btnWidth = 100.0 - padding * 2;
    // button move available
    maxPosition = 250.0 - btnWidth - padding;

    return Scaffold(
      // set background color
      backgroundColor: Colors.white.withOpacity(1.0 - percent),
      body: Center(
        // box
        child: Container(
          height: 100.0,
          width: 250.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_radius),
            color: _backgroundColor,
          ),
          child: Stack(
            children: <Widget>[
              // build button
              // add animated
              AnimatedPositioned(
                duration: Duration(milliseconds: 100),
                curve: Curves.fastOutSlowIn,
                top: padding,
                left: positionX,
                bottom: padding,
                child: GestureDetector(
                  // can move on Horizontal
                  onHorizontalDragStart: (DragStartDetails dragDetails){},
                  onHorizontalDragUpdate: (DragUpdateDetails dragDetails){
                    setState(() {
                      positionX += dragDetails.delta.dx;
//                      print("positionX = $positionX");

                      // set range
                      if(positionX >= maxPosition) positionX = maxPosition;
                      if(positionX < padding) positionX = padding;

                      // set percent
                      percent = positionX / maxPosition;  // 0.0 ~ 1.0
                    });
                  },
                  onHorizontalDragEnd: (DragEndDetails dragDetails){
                   setState(() {
                     // end state => moving auto
                     if(positionX >= maxPosition /2) positionX = maxPosition;
                     else positionX = padding;

                     percent = positionX / maxPosition;
                   });
                  },
                  child: Container(
                    width: btnWidth,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _containerColor,
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 50.0 * (1.0 - percent),
                          left: 0,
                          bottom: 50.0 * (1.0 - percent),
                          child: Container(
                            width: 50.0 * pow(percent, 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(_radius),
                                bottomRight: Radius.circular(_radius),
                              ),
                              color: _backgroundColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
