import 'package:flutter/material.dart';

// https://www.pinterest.co.kr/pin/460915343112508079/

class CustomSwitch extends StatefulWidget {
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  // color list
  Color _backgroundColor = Colors.black87;
  Color _textColor = Colors.white;

  double padding = 16.0;  // app container padding
  double paddingBtn = 6.0;  // btn padding in switch

  double positionY = 6.0;  // btn position,

  bool isSelected = false;

  // btn on clicked event function
  void _onPressed(){
    setState(() {
      isSelected = !isSelected;
      isSelected? _switchOn(): _switchOff();
    });
  }

  // if switch == on
  void _switchOn(){
    setState(() {
//      positionY => maxPosition
//      maxPosition == switch height - (btn height + padding) - padding;

      positionY = 150.0 - (50.0 - paddingBtn *2) - paddingBtn;

      // set color
      _backgroundColor = Colors.amber;
      _textColor = Colors.black;
    });
  }

  // if switch == off
  void _switchOff(){
    setState(() {
      positionY = paddingBtn;

      // set color
      _backgroundColor = Colors.black87;
      _textColor = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background color container
          Positioned.fill(
              child: Container(
                color: _backgroundColor,
              ),
          ),

          // appbar
          Positioned(
            top: 0,
            left: 0,
            child: SafeArea(
              top: true,
              left: true,
              child: IconButton(
                onPressed: (){
                  print("on clicked: ---");
                },

                icon: Icon(Icons.arrow_back_ios, size: 24.0, color: _textColor),
              ),
            ),
          ),

          // left text
          Positioned(
            top: screenHeight * 0.30,
            left: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Bedroom",
                  style: TextStyle(
                      fontSize: 60.0, color: _textColor, fontWeight: FontWeight.bold,
                    letterSpacing: 4.0,
                    fontFamily: "gibson-bold",
                  ),
                ),

                Text("74",
                  style: TextStyle(
                      fontSize: 24.0, color: _textColor, fontWeight: FontWeight.w300,
                    fontFamily: "Gibson-Regular",
                  ),
                ),
              ],
            ),
          ),

          // right widget
          Positioned(
            top: 0,
            right: padding,
            child: Container(
              height: screenHeight * 0.70,
              width: 50.0,
              child: Stack(
                children: <Widget>[
                  // white line
                  // line width = 2.0;
                  Positioned(
                    top: 0,
                    left: (50.0 - 2.0) /2,
                    right: (50.0 - 2.0) /2,
                    bottom: 0,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),

                  // switch
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    // switch height = 150.0;
                    // switch widt = 50.0;
                    child: InkWell(
                      // on clicked event : moving btn & set color
                      onTap: (){
                        _onPressed();
                      },
                      child: Container(
                        height: 150.0,
                        decoration: ShapeDecoration(
                          shape: StadiumBorder(),
                          color: Colors.black,
                        ),
                        child: Stack(
                          children: <Widget>[
                            // button in Switch
                            // add animation
                            AnimatedPositioned(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.fastOutSlowIn,
                              top: positionY,
                              left: paddingBtn,
                              right: paddingBtn,
                              child: Container(
//                              width: 50.0 - paddingBtn *2,
                                height: 50.0 - paddingBtn *2,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    ),
                                  ],
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
        ],
      ),
    );
  }
}
