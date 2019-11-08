import 'package:flutter/material.dart';
import 'package:scrollable_bottom_sheet/scrollable_bottom_sheet.dart';
import 'package:scrollable_bottom_sheet/scrollable_controller.dart';

// https://dribbble.com/shots/8045347-Form-Screen-Accounting-Appointment

class AppointmentApp extends StatefulWidget {
  @override
  _AppointmentAppState createState() => _AppointmentAppState();
}

class _AppointmentAppState extends State<AppointmentApp> {
  Color _lightColor = Color.fromRGBO(209, 234, 242, 1);
  Color _color = Color.fromRGBO(164, 211, 228, 1);
  Color _textColor = Color.fromRGBO(0, 145, 174, 1);

  String _image = "assets/sky.png";

  String title = "We focus on\nyour Story";
  String subTitle = "Because our goal, as accountants, is to provide you with a list of services that are very reliable as you go across your business journey...";

  ScrollableController controller;

  bool _minium = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // main container
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Container(
                height: screenHeight * 0.80,
                margin: EdgeInsets.only(top: 24.0),
                child: Stack(
                  children: <Widget>[
                    // color container
                    Positioned(
                      top: 0,
                      left: 24.0,
                      right: 24.0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: _color,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),

                    // light color container
                    Positioned(
                      top: 0,
                      left: 24.0,
                      right: 24.0,
                      bottom: 0,
                      child: ClipPath(
                        clipper: myClipper(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _lightColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // image
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: screenHeight * 0.40,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(_image), fit: BoxFit.fitHeight)
                        ),
                      ),
                    ),

                    // appbar
                    Positioned(
                      top: 0,
                      left: 24.0 + 24.0,
                      right: 24.0 + 24.0,
                      child: Container(
                        height: 48.0,
                        child: Row(
                          children: <Widget>[
                            Text("Y&A".toUpperCase(),
                              style: TextStyle(fontSize: 20.0, color: _textColor, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Icon(Icons.menu, size: 24.0, color: _textColor,),
                          ],
                        ),
                      ),
                    ),

                    // title, subtitle text
                    Positioned(
                      top: screenHeight * 0.10,
                      left: 24.0 + 24.0,
                      right: 24.0 + 24.0,
                      child: Container(
                        height: screenHeight * 0.35,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(title,
                              style: TextStyle(fontSize: 32.0, color: _textColor, fontWeight: FontWeight.bold),
                            ),

                            SizedBox(height: 16.0,),

                            Text(subTitle,
                              style: TextStyle(fontSize: 16.0, color: _textColor, fontWeight: FontWeight.w600, height: 1.5),
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

         // scrollable bottomsheet
         Positioned(
           left: 0,
           right: 0,
           bottom: 0,
           child: ScrollableBottomSheet(
           controller: controller,  // fixed front
             halfHeight: 300.0,
             snapBelow: true,
             snapAbove: true,
             autoPop: false,
             scrollTo: ScrollState.full,
             callback: (state){
               if(state == ScrollState.minimum){
                 setState(() {
                   print("minium");
                   _minium = true;
                 });
               } else {
                 setState(() {
                   print("not minium");
                   _minium = false;
                 });
               }
             },
             minimumHeight: screenHeight * 0.20 - 48.0,
             child: Container(
               height: screenHeight,
               color: Colors.white,
               child: Column(
                 children: <Widget>[
                   Container(
                     height: _minium? screenHeight * 0.20 - 48.0: 0.0,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Icon(Icons.keyboard_arrow_up, size: 24.0, color: _textColor,
                         ),
                         Text("Swipe Up",
                         style: TextStyle(fontSize: 16.0, color: _textColor, fontWeight: FontWeight.w600),
                         ),
                       ],
                     ),
                   ),

                   Container(
                     height: 500.0,
                     child: Placeholder(),
                   ),
                 ],
               ),
             ),

           ),
         ),
        ],
      ),
    );
  }
}

// wave clipper
class myClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    var path = new Path()
    ..lineTo(0, 0)
    ..lineTo(0, size.height)
      ..quadraticBezierTo(size.width * 0.05, size.height * 0.90, size.width * 0.25, size.height * 0.875)
      ..quadraticBezierTo(size.width * 0.495, size.height * 0.85, size.width * 0.50, size.height * 0.75)
      ..quadraticBezierTo(size.width * 0.55, size.height * 0.65, size.width * 0.75, size.height * 0.625)
      ..quadraticBezierTo(size.width * 0.995, size.height * 0.60, size.width, size.height * 0.50)
//      ..lineTo(size.width, size.height * 0.5)
    ..lineTo(size.width, 0)
    ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}

























