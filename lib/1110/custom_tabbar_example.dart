import 'package:flutter/material.dart';

// https://dribbble.com/shots/8099130-The-Belgian-Waffles-App-Concept

// https://coflutter.com/flutter-dart/get-size-and-position-of-a-widget-in-flutter/

class CustomTabbarExample extends StatefulWidget {
  @override
  _CustomTabbarExampleState createState() => _CustomTabbarExampleState();
}

class _CustomTabbarExampleState extends State<CustomTabbarExample> with TickerProviderStateMixin{
  List<Widget> pages;

  int _currentIndex = 0;

  GlobalKey _containerKey1 = GlobalKey();
  GlobalKey _containerKey2 = GlobalKey();
  GlobalKey _containerKey3 = GlobalKey();
  GlobalKey _containerKey4 = GlobalKey();

  double _positionX = 0.0;

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

    final RenderBox containerRenderBox =
    globalKey.currentContext.findRenderObject();
    final containerPosition = containerRenderBox.localToGlobal(Offset.zero);

    print("containerPosition + $containerPosition");
    _positionX = containerPosition.dx;
    print("_positionX + $_positionX");
    _currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _definePages();

    return Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Column(
          children: <Widget>[
            // appbar
            _buildCustomTabbar(),

            pages[_currentIndex]
          ],
        ),
      ),
    );
  }

  _buildCustomTabbar(){
    return Container(
      margin: EdgeInsets.zero,
      height: 64.0,
      child: Stack(
        children: <Widget>[
          // content
          Container(
            height: 64.0,
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: InkWell(
                    onTap: (){
                      _boxClicked(0);
                    },
                    key: _containerKey1,
                    child: Container(
                      child: Center(
                        child: Text("Red Velvet".toUpperCase(),
                        style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),

                Flexible(
                  child: InkWell(
                    onTap: (){
                      _boxClicked(1);
                    },
                    key: _containerKey2,
                    child: Container(
                      child: Center(
                        child: Text("c&c".toUpperCase(),
                          style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),

                Flexible(
                  child: InkWell(
                    onTap: (){
                      _boxClicked(2);
                    },
                    key: _containerKey3,
                    child: Container(
                      child: Center(
                        child: Text("Cheesecake".toUpperCase(),
                          style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),

                Flexible(
                  child: InkWell(
                    onTap: (){
                      _boxClicked(3);
                    },
                    key: _containerKey4,
                    child: Container(
                      child: Center(
                        child: Text("Classic".toUpperCase(),
                          style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // moving container
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            bottom: 0.0,
            left: _positionX + 25.0,
            child: ClipPath(
              clipper: myClipper(),
              child: Container(
                height: 40.0,
                width: 50.0,
                color: Colors.teal,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 16.0),
                    height: 10.0,
                    width: 10.0,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
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

class myClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path()
    ..lineTo(0, size.height)
    ..quadraticBezierTo(size.width * 0.13, size.height * 0.95, size.width * 0.20, size.height * 0.80)
    ..quadraticBezierTo(size.width * 0.50, 0, size.width * 0.80, size.height * 0.80)
    ..quadraticBezierTo(size.width * 0.87, size.height * 0.95, size.width, size.height)
    ..lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
