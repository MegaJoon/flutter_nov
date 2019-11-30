import 'package:flutter/material.dart';

// https://www.pinterest.co.kr/pin/460915343112508079/

class CustomSwitch extends StatefulWidget {
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  // color list
  Color _backgroundColor = Colors.black;

  double padding = 16.0;

  @override
  Widget build(BuildContext context) {
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

                icon: Icon(Icons.arrow_back_ios, size: 24.0, color: Colors.white),
              ),
            ),
          ),

          
        ],
      ),
    );
  }
}
