import 'package:flutter/material.dart';

// https://dribbble.com/shots/8272138-Splash-Screen-Daily-UI/attachments/626365?mode=media

class ClotheslinePage extends StatefulWidget {
  @override
  _ClotheslinePageState createState() => _ClotheslinePageState();
}

class _ClotheslinePageState extends State<ClotheslinePage> {
  // topRight image
  String _image = "assets/clothesline.png";

  String _title = "Clothesline";  // title
  String _subTitle = "Make the most of laundry day.";  // subtitle

  // color
  Color _color = Color.fromRGBO(62, 103, 107, 1);

  double padding = 24.0;  // padding

  @override
  Widget build(BuildContext context) {
    // device screen height
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // set background color
      backgroundColor: Colors.grey[300],

      // main
      body: Stack(
        children: <Widget>[
          // topRight image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.50,
              child: Image.asset(_image, fit: BoxFit.fill),
            ),
          ),

          // Column
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              // bottom padding
              padding: EdgeInsets.only(bottom: padding * 2),
              height: screenHeight * 0.40,
              child: Column(
                children: <Widget>[
                  // title text
                  Text(_title,
                    style: TextStyle(
                      fontSize: 60.0, color: Colors.black, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic,
                    ),
                  ),

                  // subtitle text
                  Text(_subTitle,
                    style: TextStyle(
                      fontSize: 16.0, color: Colors.black87, fontWeight: FontWeight.w400,
//                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  Spacer(),

                  // get started container
                  InkWell(
                    onTap: (){
                      print("on clicked event : move page;");
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: padding),
                      height: 48.0,
                      width: 200.0,
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(),
                        color: _color,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          // text : get started
                          Text("Get started".toUpperCase(),
                          style: TextStyle(
                            fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w400,
                          ),
                          ),

                          // icon : right arrow
                          Icon(Icons.arrow_forward, size: 20.0, color: Colors.white),
                        ],
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











