import 'package:flutter/material.dart';

// https://dribbble.com/shots/8087321-Store-Concept/attachments/543146?mode=media

class StoreConceptApp extends StatefulWidget {
  @override
  _StoreConceptAppState createState() => _StoreConceptAppState();
}

class _StoreConceptAppState extends State<StoreConceptApp> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          // appbar & tabbar
          Positioned(
            top: 0,
            left: 24.0,
            right: 24.0,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Container(
                height: 130.0,
                child: Column(
                  children: <Widget>[
                    // appbar
                    Container(
                      height: 60.0,
                      child: Row(
                        children: <Widget>[
                          Text("Shop",
                          style: TextStyle(fontSize: 10.0, color: Colors.white, fontWeight: FontWeight.w300, fontFamily: "Hanson-Bold"),
                          ),
                          Spacer(),
                          Icon(Icons.sort, size: 24.0, color: Colors.white,),
                        ],
                      ),
                    ),

                    // tabbar
                    Container(
                      height: 70.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Text("New\nArrivals",
                            style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600, fontFamily: "Hanson-Bold"),
                          ),

                          SizedBox(width: 32.0,
                          ),

                          Text("Best\nChoice",
                            style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600, fontFamily: "Hanson-Bold"),
                          ),

                          SizedBox(width: 32.0,
                          ),

                          Text("On\nSale",
                            style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600, fontFamily: "Hanson-Bold"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // main container
          Positioned(
            top: 150.0,
            left: 0,
            right: 0,
            child: Container(
              height: 500.0,
              child: Placeholder(),
            ),
          ),

          // bottom text & container
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: screenHeight * 0.30,
              child: Placeholder(),
            ),
          ),
          // main
        ],
      ),
    );
  }
}



















