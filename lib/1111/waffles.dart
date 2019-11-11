import 'dart:math';

import 'package:flutter/material.dart';
import 'my_vertical_tab.dart';

// https://dribbble.com/shots/8099130-The-Belgian-Waffles-App-Concept/attachments/546850?mode=media

class WafflesApp extends StatefulWidget {
  @override
  _WafflesAppState createState() => _WafflesAppState();
}

class _WafflesAppState extends State<WafflesApp> {
  List<Widget> pages;

  int _currentIndex = 0;  // initial page set

  // background color
  Color _backgroundColor = Color.fromRGBO(86, 51, 30, 1);

  GlobalKey _containerKey1 = GlobalKey();
  GlobalKey _containerKey2 = GlobalKey();
  GlobalKey _containerKey3 = GlobalKey();
  GlobalKey _containerKey4 = GlobalKey();

  double _positionY = 215.0;

  _boxClicked(int index){
    GlobalKey globalKey;
    if(index == 0){
      globalKey = _containerKey1;
    } else if(index == 1){
      globalKey = _containerKey2;
    } else if(index == 2){
      globalKey = _containerKey3;
    } else if(index == 3){
      globalKey = _containerKey4;
    }

    final RenderBox containerRenderBox = globalKey.currentContext.findRenderObject();
    final containerPosition = containerRenderBox.localToGlobal(Offset.zero);

//    print("containerPosition $containerPosition");
    _positionY = containerPosition.dy;
    print("_positionY $_positionY");
    //
    _currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _definePages();

    return Scaffold(
      body: Scaffold(
        body: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                // tabbar
                Container(
//              margin: EdgeInsets.zero,
                  width: 80.0,
                  color: _backgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.sort, size: 40.0, color: Colors.white),

                      Container(
                        height: 400.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                                onTap: (){
                                  _boxClicked(0);
                                  },
                                key: _containerKey1,
                                child: MyVerticalTab(text: "Classic"),
                            ),

                            InkWell(
                              onTap: (){
                                _boxClicked(1);
                              },
                                key: _containerKey2,
                                child: MyVerticalTab(text: "Cheesecake"),
                            ),

                            InkWell(
                              onTap: (){
                                _boxClicked(2);
                              },
                              key: _containerKey3,
                              child: MyVerticalTab(text: "C&C"),
                            ),

                            InkWell(
                              onTap: (){
                                _boxClicked(3);
                              },
                              key: _containerKey4,
                              child: MyVerticalTab(text: "Red Velvet"),
                            ),
                          ],
                        ),
                      ),

                      Icon(Icons.keyboard_arrow_down, size: 40.0, color: Colors.amber),
                    ],
                  ),
                ),

                // tabbar view
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  width: MediaQuery.of(context).size.width - 112.0,
                  child: pages[_currentIndex],
                ),
              ],
            ),

            // moving container
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              top: _positionY - 30.0,
              left: 40.0,
              child: ClipPath(
                clipper: myClipper01(),
                child: Container(
                  height: 80.0,
                  width: 40.0,
                  color: Colors.white,
                child: Container(
                  margin: EdgeInsets.only(top: 8.0, left: 20.0, right: 4.0, bottom: 8.0),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _definePages(){
    pages = [
      Placeholder(color: Colors.redAccent),
      Placeholder(color: Colors.amber),
      Placeholder(color: Colors.green),
      Placeholder(color: Colors.indigo),
    ];
  }
}

class myClipper01 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = new Path()
    ..lineTo(size.width, 0)
    ..quadraticBezierTo(size.width * 0.93, size.height * 0.13, size.width * 0.80, size.height * 0.20)
    ..quadraticBezierTo(0, size.height * 0.50, size.width * 0.80, size.height * 0.80)
    ..quadraticBezierTo(size.width * 0.93, size.height * 0.87, size.width, size.height)
    ..lineTo(size.width, 0)
    ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
