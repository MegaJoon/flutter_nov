import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

// https://medium.com/@meysam.mahfouzi/drawing-curved-dashed-lines-in-flutter-b5d0645b04c8
// thanks! wave dotted line;

// it's second page;
class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // background color
  Color _color = Color.fromRGBO(118, 199, 230, 1);

  // floating button color
  Color _btnColor = Color.fromRGBO(246, 118, 88, 1);

  // accent color
  Color _accentColor = Color.fromRGBO(73, 110, 125, 1);

  // title
  String title = "Keep your\nlife simple.";
  String subTitle = "Make sure, you're up to date";
  String btnText = "Let's start!";

  // background image
  String _image = "assets/sky.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // top container
          Flexible(
            flex: 6,
            child: Stack(
              children: <Widget>[
                // wave container
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 48.0,
                  child: ClipPath(
                    clipper: myClipper(),
                    child: Container(
                      color: _color,
                    ),
                  ),
                ),

                // wave dotted line
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 100.0,
                    child: CustomPaint(
                      painter: CurvePatiner(),
                      child: Container(),
                    ),
                  ),
                ),

                // appbar
                Positioned(
                  top: 0,
                  left: 24.0,
                  right: 24.0,
                  child: SafeArea(
                   top: true,
                   left: true,
                   right: true,
                   child: Container(
                     height: 64.0,
                     child: Row(
                       children: <Widget>[
                         Icon(Icons.arrow_back, size: 40.0, color: Colors.black,),
                         Spacer(),
                         Text("SKIP".toUpperCase(),
                         style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
                       ],
                     ),
                   ),
                  ),
                ),

                // center image
                Positioned(
                  top: 0,
                  left: 0,
                  right: 48.0,
                  bottom: 0,
                  child: Image.asset(_image, fit: BoxFit.contain,),
                ),
              ],
            ),
          ),

          // bottom container
          Flexible(
            flex: 4,
            child: Container(
              margin: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0, top: 48.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // title
                  Text(title,
                    style: TextStyle(color: _accentColor, fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),

                  // subTitle
                  Text(subTitle,
                    style: TextStyle(color: _color, fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),

                  // btn
                  Container(
                    margin: EdgeInsets.only(top: 16.0),
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          // onClicked event : back
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        height: 64.0,
                        width: 180.0,
                        decoration: ShapeDecoration(shape: StadiumBorder(), color: _btnColor),
                        child: Center(
                          child: Text(btnText.toUpperCase(),
                            style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),),
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
    );
  }
}

class myClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = new Path()
    ..lineTo(0.0, 0.0)
    ..lineTo(0.0, size.height - 48.0)
    ..quadraticBezierTo(size.width * 0.25, size.height, size.width * 0.50, size.height - 48.0)
    ..quadraticBezierTo(size.width * 0.75, size.height - 96.0, size.width, size.height - 48.0)
    ..lineTo(size.width, 0.0)
    ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CurvePatiner extends CustomPainter{
  Color _color = Color.fromRGBO(118, 199, 230, 1);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()

    ..color = _color.withOpacity(0.3)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

    var path = new Path()
    ..moveTo(0.0, size.height - 48.0)
    ..quadraticBezierTo(size.width * 0.25, size.height, size.width * 0.50, size.height - 48.0)
    ..quadraticBezierTo(size.width * 0.75, size.height - 96.0, size.width, size.height - 48.0);

    canvas.drawPath(dashPath(path, dashArray: CircularIntervalList<double>(<double>[8.0, 8.0])), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}












