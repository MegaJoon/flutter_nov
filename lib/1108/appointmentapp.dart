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
  Color _redColor = Color.fromRGBO(255, 122, 89, 1);

  String _image = "assets/sky.png";

  String title = "We focus on\nyour Story";
  String subTitle = "Because our goal, as accountants, is to provide you with a list of services that are very reliable as you go across your business journey...";

  ScrollableController controller;

  bool _fullScroll = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
             scrollTo: ScrollState.minimum,  // initial state !!
             callback: (state){
               _fullScroll = false;
               if(state == ScrollState.full){
                 setState(() {
                   print("full scroll");
                   _fullScroll = true;
                 });
               } else {
                 setState(() {
                   print("not full scroll");
                   _fullScroll = false;
                 });
               }
             },
             minimumHeight: screenHeight * 0.20 - 48.0,
             child: Container(
               margin: EdgeInsets.symmetric(horizontal: 16.0),
               height: screenHeight,
               color: Colors.white,
               child: Column(
                 children: <Widget>[
                   Container(
                     height: screenHeight * 0.20 - 48.0,
//                     color: Colors.amber,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Icon(_fullScroll? Icons.keyboard_arrow_down: Icons.keyboard_arrow_up, size: 24.0, color: _textColor,
                         ),
                         Text(_fullScroll? "Swipe Down" : "Swipe Up",
                         style: TextStyle(fontSize: 16.0, color: _textColor, fontWeight: FontWeight.w600),
                         ),
                       ],
                     ),
                   ),

                   Container(
                     height: screenHeight * 0.80 + 48.0,
//                     color: Colors.redAccent,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         // time
                         Container(
                           margin: EdgeInsets.symmetric(vertical: 16.0),
//                           height: 300.0,
                           height: 220.0,
                           width: MediaQuery.of(context).size.width,
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(16.0),
                             boxShadow: [BoxShadow(
                               color: Colors.black12, spreadRadius: 2, blurRadius: 4,
                             )]
                           ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: <Widget>[
                               // time
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: <Widget>[
                                   Container(
                                     height: 50.0,
                                     width: 100.0,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(8.0),
                                       color: Colors.grey[200],
                                     ),
                                     child: Center(
                                         child: Text("9:00 am",
                                         style: TextStyle(
                                           color: _textColor, fontSize: 16.0, fontWeight: FontWeight.w600
                                         ),
                                         ),
                                     ),
                                   ),

                                   Container(
                                     height: 50.0,
                                     width: 100.0,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(8.0),
                                       color: Colors.grey[200],
                                     ),
                                     child: Center(
                                       child: Text("10:00 am",
                                         style: TextStyle(
                                             color: _textColor, fontSize: 16.0, fontWeight: FontWeight.w600
                                         ),
                                       ),
                                     ),
                                   ),

                                   Container(
                                     height: 50.0,
                                     width: 100.0,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(8.0),
                                       color: Colors.grey[200],
                                     ),
                                     child: Center(
                                       child: Text("11:00 am",
                                         style: TextStyle(
                                             color: _textColor, fontSize: 16.0, fontWeight: FontWeight.w600
                                         ),
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: <Widget>[
                                   Container(
                                     height: 50.0,
                                     width: 100.0,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(8.0),
                                       color: _redColor,
                                     ),
                                     child: Center(
                                       child: Text("12:00 am",
                                         style: TextStyle(
                                             color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600
                                         ),
                                       ),
                                     ),
                                   ),

                                   Container(
                                     height: 50.0,
                                     width: 100.0,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(8.0),
                                       color: Colors.grey[200],
                                     ),
                                     child: Center(
                                       child: Text("1:00 pm",
                                         style: TextStyle(
                                             color: _textColor, fontSize: 16.0, fontWeight: FontWeight.w600
                                         ),
                                       ),
                                     ),
                                   ),

                                   Container(
                                     height: 50.0,
                                     width: 100.0,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(8.0),
                                       color: Colors.grey[200],
                                     ),
                                     child: Center(
                                       child: Text("2:00 pm",
                                         style: TextStyle(
                                             color: _textColor, fontSize: 16.0, fontWeight: FontWeight.w600
                                         ),
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: <Widget>[
//                                   Container(
//                                     height: 50.0,
//                                     width: 100.0,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(8.0),
//                                       color: Colors.grey[200],
//                                     ),
//                                     child: Center(
//                                       child: Text("3:00 pm",
//                                         style: TextStyle(
//                                             color: _textColor, fontSize: 16.0, fontWeight: FontWeight.w600
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//
//                                   Container(
//                                     height: 50.0,
//                                     width: 100.0,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(8.0),
//                                       color: Colors.grey[200],
//                                     ),
//                                     child: Center(
//                                       child: Text("4:00 pm",
//                                         style: TextStyle(
//                                             color: _textColor, fontSize: 16.0, fontWeight: FontWeight.w600
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//
//                                   Container(
//                                     height: 50.0,
//                                     width: 100.0,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(8.0),
//                                       color: Colors.grey[200],
//                                     ),
//                                     child: Center(
//                                       child: Text("5:00 pm",
//                                         style: TextStyle(
//                                             color: _textColor, fontSize: 16.0, fontWeight: FontWeight.w600
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),

                               // !
                               Container(
                                 margin: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0, top: 16.0),
                                 height: 60.0,
                                 width: screenWidth,
                                 decoration: BoxDecoration(
                                   color: _lightColor,
                                   borderRadius: BorderRadius.circular(8.0),
                                 ),
                                 child: Row(
                                   children: <Widget>[
                                     // ! container
                                     Container(
                                       margin: EdgeInsets.symmetric(horizontal: 16.0),
                                       height: 24.0,
                                       width: 24.0,
                                       decoration: BoxDecoration(
                                         shape: BoxShape.circle,
                                         color: _color,
                                       ),
                                       child: Center(
                                         child: Text("!",
                                         style: TextStyle(fontSize: 16.0, color: _textColor, fontWeight: FontWeight.w600),
                                         ),
                                       ),
                                     ),

                                     // text
                                     Text("All times are in\nCentral Time (US & Canada)",
                                       style: TextStyle(fontSize: 14.0, color: _textColor, fontWeight: FontWeight.w400),
                                     ),

                                     Spacer(),

                                     // icon >
                                     Icon(Icons.arrow_forward_ios, size: 24.0, color: _textColor,),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ),

                         // add your details
                         Container(
                           height: 250.0,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                               Text("Add your details",
                               style: TextStyle(fontSize: 24.0, color: _textColor, fontWeight: FontWeight.bold),
                               ),

                               // grey container
                               // name
                               Container(
                                 margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                                 padding: EdgeInsets.only(left: 16.0),
                                 height: 48.0,
                                 decoration: BoxDecoration(
                                   color: Colors.grey[200],
                                   borderRadius: BorderRadius.circular(8.0),
                                 ),
                                 child: Row(
                                   children: <Widget>[
                                     Text("Name",
                                     style: TextStyle(fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.w400),
                                     ),

                                     SizedBox(
                                       width: 32.0,
                                     ),

                                     Text("Bettie Morton",
                                       style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w400),
                                     ),
                                   ],
                                 ),
                               ),

                               // email
                               Container(
                                 margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                                 padding: EdgeInsets.only(left: 16.0),
                                 height: 48.0,
                                 decoration: BoxDecoration(
                                   color: Colors.grey[200],
                                   borderRadius: BorderRadius.circular(8.0),
                                 ),
                                 child: Row(
                                   children: <Widget>[
                                     Text("Email",
                                       style: TextStyle(fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.w400),
                                     ),

                                     SizedBox(
                                       width: 32.0,
                                     ),

                                     Text("bettie.morton@gmail.com",
                                       style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w400),
                                     ),
                                   ],
                                 ),
                               ),

                               // phone
//                               Container(
//                                 margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
//                                 padding: EdgeInsets.only(left: 16.0),
//                                 height: 48.0,
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey[200],
//                                   borderRadius: BorderRadius.circular(8.0),
//                                 ),
//                                 child: Row(
//                                   children: <Widget>[
//                                     Text("Phone",
//                                       style: TextStyle(fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.w400),
//                                     ),
//
//                                     SizedBox(
//                                       width: 32.0,
//                                     ),
//
//                                     Text("+1 212-284-1800",
//                                       style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w400),
//                                     ),
//                                   ],
//                                 ),
//                               ),

                               // please .......
                               Container(
                                 margin: EdgeInsets.only(bottom: 8.0),
                                 height: 48.0,
                                 width: screenWidth,
                                 decoration: BoxDecoration(
                                   color: _lightColor,
                                   borderRadius: BorderRadius.circular(8.0),
                                 ),
                                 child: Row(
                                   children: <Widget>[
                                     // ! container
                                     Container(
                                       margin: EdgeInsets.symmetric(horizontal: 16.0),
                                       height: 24.0,
                                       width: 24.0,
                                       decoration: BoxDecoration(
                                         shape: BoxShape.circle,
                                         color: _color,
                                       ),
                                       child: Center(
                                         child: Text("?",
                                           style: TextStyle(fontSize: 16.0, color: _textColor, fontWeight: FontWeight.w600),
                                         ),
                                       ),
                                     ),

                                     // text
                                     Text("Please let us know if you have any\nspecial requests.",
                                       style: TextStyle(fontSize: 14.0, color: _textColor, fontWeight: FontWeight.w400),
                                     ),
                                   ],
                                 ),
                               ),

                               // text 1
                               Align(
                                 alignment: Alignment.center,
                                 child: Text("By Clicking below you agree to these",
                                 style: TextStyle(fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w400),
                                 ),
                               ),

                               // text 2
                               Align(
                                   alignment: Alignment.center,
                                 child: Text("Privacy Policies.",
                                   style: TextStyle(fontSize: 12.0, color: _redColor, fontWeight: FontWeight.w400),
                                 ),
                               ),
                             ],
                           ),
                         ),

                         // book now
                         Container(
                           height: 60.0,
                           decoration: ShapeDecoration(shape: StadiumBorder(),
                           color: _redColor),
                           child: Center(
                               child: Text("Book Now",
                               style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
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

























