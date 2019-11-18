import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nov/1118/dotted_line.dart';
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
                                  color: Colors.white, shape: BoxShape.circle),
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
                                  color: Colors.white, shape: BoxShape.circle),
                            ),
                          ),

                          // plane icon
                          Positioned(
                            top: 8.0,
                            left: 50.0,
                            right: 50.0,
                            child: Icon(Icons.flight_takeoff,
                                size: 30.0, color: Colors.white),
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
            bottom: 100.0,
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(padding * 0.5),
//                  height: 200.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 1)
                        ]),
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Depart",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "06:50",
                                        style: TextStyle(
                                            fontSize: 28.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/emirates.png",
                                        fit: BoxFit.fitHeight,
                                        height: 50.0,
                                      ),
                                      Text(
                                        "Emirates",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Arrive",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "17:55",
                                        style: TextStyle(
                                            fontSize: 28.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 18.0,
                                left: 100.0,
                                right: 100.0,
                                bottom: 17.0,
                                child: Container(
                                  height: 1.0,
                                  color: Colors.grey,
                                ),
                              ),
                              Positioned(
                                top: 8.0,
                                left: 120.0,
                                right: 120.0,
                                bottom: 8.0,
                                child: Container(
                                  decoration: ShapeDecoration(
                                      shape: StadiumBorder(
                                          side: BorderSide(
                                              color: Colors.grey, width: 1.0)),
                                      color: Colors.white),
                                  child: Center(
                                    child: Text(
                                      "10h 05M 0stop",
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Monday",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "November 18",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "ET490",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "A380-800",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Sunday",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "November 29",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
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
                SizedBox(height: padding * 2),

                // bottom container
                Flexible(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 1)
                        ]),
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(padding * 0.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 12.0),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          "Passenger",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Mr.Gavin Alfons",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 32.0,
                                      width: 100.0,
                                      decoration: ShapeDecoration(
                                        shape: StadiumBorder(),
                                        color: _accentColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Add-ons",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: Center(
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Terminal",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "T3",
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Center(
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Check-in",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "D15",
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Center(
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Gate",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "C",
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Center(
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Boarding",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "06:00",
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        // divider
                        Container(
                          height: 2.0,
                          child: Dottedline(),
                        ),

                        Flexible(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.all(padding * 0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Align(
                                alignment: Alignment.centerLeft,
                                  child: Text("Barcode",
                                    style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600),
                                ),
                                ),

                                // barcode image
                                Container(
                                  height: 80.0,
                                  width: double.infinity,
                                  child: Image.asset("assets/barcode.jpg", fit: BoxFit.fill),
                                ),

                                Text("ET-10255471FA",
                                style: TextStyle(
                                  fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold
                                ),
                                ),

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

class MyPainter extends CustomPainter {
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
      ..quadraticBezierTo(size.width * 0.50, 0, size.width, size.height * 0.50);

    canvas.drawPath(
        dashPath(
          path,
          dashArray: CircularIntervalList<double>(<double>[8.0, 8.0]),
        ),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
