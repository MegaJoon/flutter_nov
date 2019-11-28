import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nov/1128/blu_item_list.dart';
import 'package:flutter_nov/1128/item_detail_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path_drawing/path_drawing.dart';

// https://dribbble.com/shots/6586954-Biutimi-App/attachments

class BiutimiApp extends StatefulWidget {
  @override
  _BiutimiAppState createState() => _BiutimiAppState();
}

class _BiutimiAppState extends State<BiutimiApp> {
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  double padding = 16.0;
  double bottomPadding = 16.0;

  // container color
  Color _color = Color.fromRGBO(86, 238, 173, 1);

  // initial / center position
  LatLng _initialPosition = LatLng(37.50573803291112, 126.9531999345871);

  List<Marker> markers = <Marker>[];

  // function add mark
  void _addMark(){
    for(int i = 0; i < bluList.length; i++){
      markers.add(
          Marker(
            markerId: MarkerId(bluList[i].name),
            position: bluList[i].latLng,
            infoWindow: InfoWindow(
              title: bluList[i].name,
              snippet: bluList[i].text,
            ),

            icon: i == bluList.length -1? BitmapDescriptor.defaultMarkerWithHue(60.0) : BitmapDescriptor.defaultMarker,
            onTap: (){},
          ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // add mark
    _addMark();

    // set circle
    Set<Circle> circles = Set.from([Circle(
      circleId: CircleId("Center"),
      center: _initialPosition,
      fillColor: Colors.red.withOpacity(0.1),
      strokeColor: Colors.red.withOpacity(0.5),
      strokeWidth: 2,
      radius: 900,
    )]);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // backgroud : google map
          Positioned.fill(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              mapType: MapType.normal,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 15.0,
              ),

              // markers
              markers: Set<Marker>.of(markers),

              // circle
              circles: circles,

              // move start event
              onCameraMoveStarted: () {
                setState(() {
                  bottomPadding = -250.0;
                });
              },

              // move end event
              onCameraIdle: () {
                setState(() {
                  bottomPadding = 16.0;
                });
              },
            ),
          ),

          // appbar : textfield
          Positioned(
            top: padding,
            left: padding,
            right: padding,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: padding * 0.5),
                height: 52.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 1,
                    )
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    // textfield
                    Flexible(
                      fit: FlexFit.tight,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "hint text",
                          hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.bold),
                          contentPadding: EdgeInsets.only(left: padding),
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    // icon
                    Icon(Icons.list, size: 28.0, color: Colors.black),
                    SizedBox(width: padding * 0.5),
                    Icon(Icons.search, size: 28.0, color: Colors.black),
                  ],
                ),
              ),
            ),
          ),

          // bottom container
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            curve: Curves.fastOutSlowIn,
            left: padding,
            right: 0,
            bottom: bottomPadding,
            child: Container(
              height: 250.0,
              child: Column(
                children: <Widget>[
                  // what is container??
                  Container(
                    margin: EdgeInsets.only(right: padding),
                    height: 52.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: _color,
                      boxShadow: [
                        BoxShadow(
                          color: _color.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "...shit",
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // pageview
                  Container(
                    height: 198.0,
                    child: ListView.builder(
                        padding: EdgeInsets.only(top: padding),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: bluList.length -1,  // last item : center position
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetailPage(index)));
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: padding),
                              padding: EdgeInsets.symmetric(vertical: padding, horizontal: padding * 1.5),
                              width: 130.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  // profile image
                                  Container(
                                    height: 60.0,
                                    width: 90.0,
                                    child: Stack(
                                      children: <Widget>[
                                        // profile image
                                        Positioned(
                                          top: 0,
                                          left: 10.0,
                                          right: 10.0,
                                          bottom: 0,
                                          child: Hero(
                                            tag: "item $index",
                                            child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: AssetImage(bluList[index].profileImage),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        // star icon
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                            height: 28.0,
                                            width: 28.0,
                                            child: Stack(
                                              children: <Widget>[
                                                Positioned.fill(
                                                  child: Center(
                                                    child: Icon(Icons.star, size: 28.0, color: Colors.yellow),
                                                  ),
                                                ),
                                                Positioned.fill(
                                                  child: Center(
                                                    child: Text(
                                                      "5",
                                                      style: TextStyle(
                                                        fontSize: 8.0,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                      ),
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

                                  // name
                                  Text(
                                    bluList[index].name,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  // text
                                  Text(
                                    bluList[index].name,
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  // icons
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      bluList[index].tag1 ? Icon(FontAwesomeIcons.handScissors, size: 16.0, color: Colors.grey) : Container(),
                                      bluList[index].tag2 ? Icon(FontAwesomeIcons.lemon, size: 16.0, color: Colors.grey) : Container(),
                                      bluList[index].tag3 ? Icon(FontAwesomeIcons.codepen, size: 16.0, color: Colors.grey) : Container(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
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