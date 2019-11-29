import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_nov/1128/biutimi_list.dart';
import 'package:flutter_nov/1128/second_biutimi.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BiutimiApp extends StatefulWidget {
  @override
  _BiutimiAppState createState() => _BiutimiAppState();
}

class _BiutimiAppState extends State<BiutimiApp> {
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller){
    _controller.complete(controller);
  }

  double padding = 16.0;
  double bottomPadding = 16.0;

  // initial position : center point
  LatLng _initialPosition = LatLng(37.50573803291112, 126.9531999345871);

  List<Marker> markers = <Marker>[];

  void _addMarker() async{
    for(int i = 0; i<biutimiList.length; i++){

      final Uint8List markerIcon = await getBytesFromCanvas();

      markers.add(
        Marker(
          markerId: MarkerId(biutimiList[i].name),
          position: biutimiList[i].position,
          infoWindow: InfoWindow(
            title: biutimiList[i].name,
            snippet: biutimiList[i].text,
          ),

//          icon: i == biutimiList.length -1? BitmapDescriptor.defaultMarkerWithHue(60.0) : BitmapDescriptor.defaultMarker,
          icon: i == biutimiList.length -1?  BitmapDescriptor.fromBytes(markerIcon) : BitmapDescriptor.defaultMarker,
        ),
      );
    }
  }


  // I dont know this...
  Future<Uint8List> getBytesFromCanvas() async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint();
    paint.color = Colors.yellow;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, 80.0, 80.0),
          topLeft: Radius.circular(48.0),
          topRight: Radius.circular(48.0),
          bottomLeft: Radius.circular(48.0),
          bottomRight: Radius.circular(48.0),
        ),
        paint);

    final img = await pictureRecorder.endRecording().toImage(80, 80);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    // add marker in google mpa
    _addMarker();

    // set circles
    Set<Circle> circles = Set.from([
      Circle(
        circleId: CircleId("Center"),
        center: _initialPosition,
        radius: 800,
        fillColor: Colors.red.withOpacity(0.1),
        strokeColor: Colors.red.withOpacity(0.5),
        strokeWidth: 2,
      ),
    ]);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background : google map
          Positioned.fill(
              child: GoogleMap(
                // controller
                onMapCreated: _onMapCreated,

                // position
                initialCameraPosition: CameraPosition(
                  target: _initialPosition,
                  zoom: 15.0,
                ),

                // marker
                markers: Set<Marker>.of(markers),

                // move start
                onCameraMoveStarted: (){
                  setState(() {
                    bottomPadding = -230.0;
                  });
                },

                // move end
                onCameraIdle: (){
                  setState(() {
                    bottomPadding = 16.0;
                  });
                },

                // set circles
                circles: circles,
              ),
          ),

          // appbar
          Positioned(
            top: padding,
            left: padding,
            right: padding,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Container(
                height: 48.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                ),
                child: Row(
                  children: <Widget>[
                    // textfield
                    Flexible(
                      fit: FlexFit.tight,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search...",
                          hintStyle: TextStyle(fontSize: 16.0, color: Colors.black12, fontWeight: FontWeight.w600),
                          contentPadding: EdgeInsets.only(left: padding)
                        ),
                      ),
                    ),

                    // icons
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.toc, size: 24.0, color: Colors.black),
                    ),

                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.search, size: 24.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // bottom
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: 0,
            right: 0,
            bottom: bottomPadding,
            child: Container(
              height: 230.0,  //
              child: Column(
                children: <Widget>[
                  // check : color container
                  InkWell(
                    onTap: (){
                      print("on clicked: Check box!");
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: padding),
                      height: 48.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Color.fromRGBO(86, 238, 173, 1),
                      ),
                      child: Center(
                          child: Text("Check Box",
                          style: TextStyle(
                            fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600,
                          ),
                          ),
                      ),
                    ),
                  ),

                  // listview
                  Flexible(
                    fit: FlexFit.tight,
                    child: ListView.builder(
                        padding: EdgeInsets.only(top: padding),
                        shrinkWrap: true,
                        itemCount: biutimiList.length -1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondBiutimi(index)));
                            },
                            child: Transform.translate(
                              offset: Offset(padding, 0.0),
                              child: Container(
                                margin: EdgeInsets.only(right: padding),
                                padding: EdgeInsets.all(padding),
                                width: 150.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                  boxShadow: [BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                  )],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    // progile image
                                    Container(
                                      height: 60.0,
                                      width: 80.0,
                                      child: Stack(
                                        children: <Widget>[
                                          // circle container
                                          Positioned(
                                            top: 0,
                                            left: 10.0,
                                            right: 10.0,
                                            bottom: 0,
                                            child: Hero(
                                              tag: "index $index",
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    image: AssetImage(biutimiList[index].image),
                                                    fit:  BoxFit.fill,
                                                  ),
                                                  boxShadow: [BoxShadow(
                                                    color: Colors.black12,
                                                    spreadRadius: 1,
                                                    blurRadius: 1,
                                                  )],
                                                ),
                                              ),
                                            ),
                                          ),

                                          // star icon
                                          Positioned(
                                            top: 0,
                                            right: -5.0,
                                            child: Container(
                                              height: 32.0,
                                              width: 32.0,
                                              child: Stack(
                                                children: <Widget>[
                                                  // star icon
                                                  Positioned(
                                                    top: 0,
                                                    right: 0,
                                                    child: Icon(Icons.star, size: 32.0, color: Colors.red),
                                                  ),

                                                  // text
                                                  Positioned(
                                                    top: 10.0,
                                                    right: 12.0,
                                                    child: Center(
                                                        child: Text("5",
                                                        style: TextStyle(
                                                          fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.w600,
                                                        ),
                                                        ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ),
                                        ],
                                      ),
                                    ),

                                    // name
                                    Text(biutimiList[index].name,
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),
                                    ),

                                    // text
                                    Text(biutimiList[index].text,
                                      style: TextStyle(
                                          fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w400),
                                    ),

                                    // icons
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        biutimiList[index].tag1? Icon(FontAwesomeIcons.handScissors, size: 20.0, color: Colors.grey): Container(),
                                        biutimiList[index].tag2? Icon(FontAwesomeIcons.lemon, size: 20.0, color: Colors.grey): Container(),
                                        biutimiList[index].tag3? Icon(FontAwesomeIcons.codepen, size: 20.0, color: Colors.grey): Container(),
                                      ],
                                    ),
                                  ],
                                ),
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
