import 'package:flutter/material.dart';

// https://dribbble.com/shots/8171324-Travel-Community-App/attachments/569173?mode=media

class SecondTravelCommunityApp extends StatefulWidget {
  @override
  _SecondTravelCommunityAppState createState() => _SecondTravelCommunityAppState();
}

class _SecondTravelCommunityAppState extends State<SecondTravelCommunityApp> {
  String title = "Near Events";

  // profile image
  String _profileImage = "https://cdn.pixabay.com/photo/2019/11/08/09/27/panorama-4610864__340.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        backgroundColor: Colors.white,

        // menu icon
        leading: Icon(Icons.menu, size: 28.0, color: Colors.black),

        // title
        centerTitle: true,
        title: Text(title,
          style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),

        // profile image
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 24.0, top: 8.0, bottom: 8.0),
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(_profileImage), fit: BoxFit.fill),
            ),
          ),
        ],
      ),

      // body
      body: Placeholder(),
    );
  }
}
