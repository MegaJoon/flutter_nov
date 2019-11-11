import 'package:flutter/material.dart';
import 'package:flutter_nov/1111/waffleItem.dart';
import 'my_vertical_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  Color _color = Color.fromRGBO(255, 212, 0, 1);

  String title = "The Belgian Waffle";

  GlobalKey _containerKey1 = GlobalKey();
  GlobalKey _containerKey2 = GlobalKey();
  GlobalKey _containerKey3 = GlobalKey();
  GlobalKey _containerKey4 = GlobalKey();

  double _positionY = 140.0;

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
            SafeArea(
              top: true,
              child: Row(
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

                        Icon(Icons.keyboard_arrow_down, size: 40.0, color: _color),
                      ],
                    ),
                  ),

                  // tabbar view
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.0),
                    width: MediaQuery.of(context).size.width - 128.0,
                    child: pages[_currentIndex],
                  ),
                ],
              ),
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
                  decoration: BoxDecoration(shape: BoxShape.circle, color: _color),
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
      // first page
      Container(
        child: SafeArea(
          top: true,
          left: true,
          right: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // shopping bag icon
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                  height: 40.0,
                  alignment: Alignment.centerRight,
                  child: Icon(FontAwesomeIcons.shoppingBag, size: 32.0, color: Colors.black),
              ),

              // title
              Text(title,
              style: TextStyle(fontSize: 24.0, color: _backgroundColor, fontWeight: FontWeight.bold),
              ),

              // input textfield
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                height: 24.0,
                width: 230.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 6.0, left: 6.0, bottom: 6.0),
                    border: InputBorder.none,
                    hintText: "Find a flavor or ingredient",
                    hintStyle: TextStyle(fontSize: 12.0, color: _backgroundColor.withOpacity(0.5), fontWeight: FontWeight.w400),
                    suffixIcon: Icon(Icons.search, size: 20.0, color: Colors.black),
                  ),
                ),
              ),

              // Waffle list 1
              Container(
                margin: EdgeInsets.only(top: 32.0, bottom: 16.0),
                height: 240.0,
                child: Stack(
                  children: <Widget>[
                    // container
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 40.0,
                      bottom: 40.0,
                      child: Container(
                        padding: EdgeInsets.all(24.0),
                        decoration: BoxDecoration(
                          color: _color,
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(waffleItem[0].title,
                                style: TextStyle(color: _backgroundColor, fontSize: 20.0, fontWeight: FontWeight.w400),
                                ),

                                Text(waffleItem[0].subTitle,
                                  style: TextStyle(color: _backgroundColor, fontSize: 20.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                            Spacer(),

                            Icon(Icons.favorite_border, size: 32.0, color: _backgroundColor,),
                          ],
                        ),
                      ),
                    ),

                    // white tab indicator
                    Positioned(
                      top: 100.0 - 45.0,
                      right: 40.0,
                      child: ClipPath(
                        clipper: myClipper01(),
                        child: Container(
                          height: 90.0,
                          width: 45.0,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // right button
                    Positioned(
                      top: 100.0 - 20.0,
                      right: 20.0,
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: _color,
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(
                            color: Colors.black12, spreadRadius: 1, blurRadius: 1
                          )]
                        ),
                        child: Center(
                            child: Icon(Icons.add, size: 28.0, color: Colors.black),
                        ),
                      ),
                    ),

                    // waffle image
                    Positioned(
                      left: 40.0,
                      right: 40.0 + 40.0,
                      bottom: 16.0,
                      child: Container(
                        height: 100.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(waffleItem[0].image),
                            fit: BoxFit.cover
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // waffle list 2
              Container(
                height: 240.0,
                child: Stack(
                  children: <Widget>[
                    // container
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 40.0,
                      bottom: 40.0,
                      child: Container(
                        padding: EdgeInsets.all(24.0),
                        decoration: BoxDecoration(
                          color: _backgroundColor,
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(waffleItem[1].title,
                                  style: TextStyle(color: _color, fontSize: 20.0, fontWeight: FontWeight.w400),
                                ),

                                Text(waffleItem[1].subTitle,
                                  style: TextStyle(color: _color, fontSize: 20.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                            Spacer(),

                            Icon(Icons.favorite_border, size: 32.0, color: _color,),
                          ],
                        ),
                      ),
                    ),

                    // white tab indicator
                    Positioned(
                      top: 100.0 - 45.0,
                      right: 40.0,
                      child: ClipPath(
                        clipper: myClipper01(),
                        child: Container(
                          height: 90.0,
                          width: 45.0,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // right button
                    Positioned(
                      top: 100.0 - 20.0,
                      right: 20.0,
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            color: _backgroundColor,
                            shape: BoxShape.circle,
                            boxShadow: [BoxShadow(
                                color: Colors.black12, spreadRadius: 1, blurRadius: 1
                            )]
                        ),
                        child: Center(
                          child: Icon(Icons.add, size: 28.0, color: _color),
                        ),
                      ),
                    ),

                    // waffle image
                    Positioned(
                      left: 60.0,
                      right: 40.0 + 60.0,
                      bottom: 16.0,
                      child: Container(
                        height: 100.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(waffleItem[1].image),
                              fit: BoxFit.cover
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      //
      Placeholder(color: _color),
      Placeholder(color: Colors.green),
      Placeholder(color: Colors.indigo),
    ];
  }
}

// tab indicator
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
