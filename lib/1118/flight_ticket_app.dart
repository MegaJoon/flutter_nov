import 'package:flutter/material.dart';

// https://dribbble.com/shots/8243654-Flight-ticket-UI-design-Passenger-details/attachments/604441?mode=media

class FlightTicketApp extends StatefulWidget {
  @override
  _FlightTicketAppState createState() => _FlightTicketAppState();
}

class _FlightTicketAppState extends State<FlightTicketApp> {
  Color _color = Color.fromRGBO(1, 100, 212, 1);
  Color _accentColor = Color.fromRGBO(34, 82, 136, 1);

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
              height: 200.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [_color, _accentColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              ),
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
