import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

// https://dribbble.com/shots/8243654-Flight-ticket-UI-design-Passenger-details/attachments/604441?mode=media

class FlightTicketApp extends StatefulWidget {
  @override
  _FlightTicketAppState createState() => _FlightTicketAppState();
}

class _FlightTicketAppState extends State<FlightTicketApp> {
  Color _color = Color.fromRGBO(1, 100, 212, 1);
  Color _accentColor = Color.fromRGBO(34, 82, 136, 1);

  double padding = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // top background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: padding),
              height: 250.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [_color, _accentColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "CGK".toUpperCase(),
                          style: TextStyle(
                            fontSize: 32.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Jakarta, ID",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Flexible(
                    flex: 3,
                    child: Container(
                      height: 120.0,
                      child: Stack(
                        children: <Widget>[
                          // dotted line
                          Positioned(
                            top: 0,
                            left: padding * 0.50,
                            right: padding * 0.50,
                            bottom: 0,
                            child: CustomPaint(
                              painter: MyPainter(),
                            ),
                          ),

                          // left circle
                          Positioned(
                            top: 58.0,
                            left: padding * 0.50 - 8.0,
                            child: Container(
                              height: 8.0,
                              width: 8.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                              ),
                            ),
                          ),

                          // right circle
                          Positioned(
                            top: 58.0,
                            right: padding * 0.50 - 8.0,
                            child: Container(
                              height: 8.0,
                              width: 8.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle
                              ),
                            ),
                          ),

                          // plane icon
                          Positioned(
                            top: 8.0,
                            left: 50.0,
                            right: 50.0,
                            child : Icon(Icons.flight_takeoff, size: 30.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "LHR".toUpperCase(),
                          style: TextStyle(
                            fontSize: 32.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "London, UK",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // appbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: padding),
                height: 40.0,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back,
                      size: 28.0,
                      color: Colors.white,
                    ),
                    Spacer(),
                    Badge(
                      showBadge: true,
                      badgeColor: Colors.yellow,
                      position: BadgePosition.topRight(top: 0, right: 0),
                      child: Icon(
                        Icons.notifications,
                        size: 28.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // first container
          Positioned(
            top: 180.0,
            left: padding,
            right: padding,
            child: Container(
              height: 200.0,
              child: Placeholder(),
            ),
          ),
        ],
      ),

      // floatingbtn
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.yellow,
        icon: Icon(Icons.print, size: 20.0, color: _color),
        label: Text(
          "Print Ticket",
          style: TextStyle(
              fontSize: 12.0, color: _color, fontWeight: FontWeight.w600),
        ),
      ),

      // floating btn location
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
        ..color = Colors.white
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 2.0
        ..style = PaintingStyle.stroke;

    var path = Path()
    ..moveTo(0, size.height * 0.50)
//    ..lineTo(0, size.height * 0.80)
    ..quadraticBezierTo(size.width * 0.50, 0,
        size.width, size.height * 0.50);

    canvas.drawPath(dashPath(path, dashArray: CircularIntervalList<double>(<double>[8.0, 8.0]),
    ), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


























