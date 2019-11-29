import 'package:flutter/material.dart';

// https://dribbble.com/shots/8580188-Medical-app/attachments/845968?mode=media

class MedicalApp extends StatefulWidget {
  @override
  _MedicalAppState createState() => _MedicalAppState();
}

class _MedicalAppState extends State<MedicalApp> {
  // color list
  Color _color = Color.fromRGBO(121, 199, 153, 1);
  Color _color2 = Color.fromRGBO(73, 167, 157, 1);

  double padding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background gradient color
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [_color, _color2],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Good Morning!",
                      style: TextStyle(
                        fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w400,
                      ),
                      ),

                      Text("Eugenia Burke!",
                        style: TextStyle(
                          fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),

          // left binder ring shadow
          Positioned(
            right: padding *4.0,
            bottom: 210.0,
            child: ClipPath(
              clipper: myClipper(),
              child: Container(
                height: 30.0,
                width: 25.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),

          // right binder ring shadow
          Positioned(
            left: padding *5.7,
            bottom: 210.0,
            child: ClipPath(
              clipper: myClipper(),
              child: Container(
                height: 30.0,
                width: 25.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),

          // top container
          Positioned(
            top: 100.0,
            left: padding,
            right: padding,
            child: Container(
              height: 350.0,
              child: Stack(
                children: <Widget>[
                  // main
                  Positioned(
                    top: padding,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.white,
                      ),
                      child: Placeholder(),
                    ),
                  ),

                  // profile image
                  Positioned(
                    top: 0,
                    right: padding,
                    child: Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        image: DecorationImage(
                          image: NetworkImage("https://cdn.pixabay.com/photo/2017/03/22/19/07/ambulance-2166079__340.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
//                      child: Placeholder(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // bottom container
          Positioned(
            left: padding,
            right: padding,
            bottom: padding,
            child: Container(
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
              ),
              child: Placeholder(),
            ),
          ),

          // left binder image
          Positioned(
            left: padding *3,
            bottom: 150.0,
            child: Container(
              height: 150.0,
              width: 100.0,
              child: Image.asset("assets/binder_ring.png", fit: BoxFit.cover),
            ),
          ),

          // right binder image
          Positioned(
            right: padding *2,
            bottom: 150.0,
            child: Container(
              height: 150.0,
              width: 100.0,
              child: Image.asset("assets/binder_ring.png", fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}

class myClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path()
    ..lineTo(0.0, 0.0)
    ..quadraticBezierTo(size.width *0.25, size.height *0.50, 0.0, size.height)
    ..lineTo(size.width *0.25, size.height)
    ..quadraticBezierTo(size.width * 0.50, size.height * 0.50, size.width * 0.25, 0.0)
    ..lineTo(size.width * 0.25, 0.0)
    ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}













