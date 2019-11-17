import 'package:flutter/material.dart';

class PaymentDonePage extends StatefulWidget {
  @override
  _PaymentDonePageState createState() => _PaymentDonePageState();
}

class _PaymentDonePageState extends State<PaymentDonePage> {
  double padding = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Payment Done",
          style: TextStyle(
              fontSize: 24.0, color: Colors.deepPurpleAccent, fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: <Widget>[
          // background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 168.0,
            child: Image.asset("assets/pattern.jpg", fit: BoxFit.fill,
              colorBlendMode: BlendMode.dstATop,
              color: Colors.black12.withOpacity(0.1),
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // circle icon
                  Icon(Icons.check_circle, size: 80.0, color: Colors.deepPurpleAccent),

                  Spacer(),

                  // orders
                  ClipPath(
                    clipper: myClipper(),
                    child: Container(
                      padding: EdgeInsets.all(padding),
                      height: 300.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12, width: 1.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Recipient Details", style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w400),),
                          Text("777 Brockton Avenue, Abington MA 2351.", style: TextStyle(fontSize: 12.0, color: Colors.black54, fontWeight: FontWeight.w400),),
                          Text("+1 (404) 960-3807", style: TextStyle(fontSize: 12.0, color: Colors.black54, fontWeight: FontWeight.w400),),

                          Divider(height: 2.0, color: Colors.black54),

                          Row(
                            children: <Widget>[
                              Text("Subtotal (4 items)", style: TextStyle(fontSize: 12.0, color: Colors.black54, fontWeight: FontWeight.w400),),
                              Spacer(),
                              Text("\$31", style: TextStyle(fontSize: 12.0, color: Colors.green, fontWeight: FontWeight.w400),),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text("Coupon discount", style: TextStyle(fontSize: 12.0, color: Colors.black54, fontWeight: FontWeight.w400),),
                              Spacer(),
                              Text("-\$5", style: TextStyle(fontSize: 12.0, color: Colors.red, fontWeight: FontWeight.w400),),
                            ],
                          ),

                          Row(
                            children: <Widget>[
                              Text("Delivery Charges", style: TextStyle(fontSize: 12.0, color: Colors.black54, fontWeight: FontWeight.w400),),
                              Spacer(),
                              Text("+\$3", style: TextStyle(fontSize: 12.0, color: Colors.black54, fontWeight: FontWeight.w600),),
                            ],
                          ),

                          Divider(height: 2.0, color: Colors.black54),

                          Row(
                            children: <Widget>[
                              Text("Total", style: TextStyle(fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w400),),
                              Spacer(),
                              Text("\$29", style: TextStyle(fontSize: 12.0, color: Colors.black54, fontWeight: FontWeight.w600),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Spacer(),

                  //
                  Text("Please Collect your receipt.",
                  style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w400),
                  ),

                  Spacer(),

                  // bottom 1
                  Container(
                    margin: EdgeInsets.only(bottom: 16.0),
                    height: 48.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(color: Colors.deepPurpleAccent, width: 1.0),
                    ),
                    child: Center(
                      child: Text("Go to Dashboard",
                        style: TextStyle(fontSize: 16.0, color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  // bottom 2
                  Container(
                    height: 48.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.deepPurpleAccent
                    ),
                    child: Center(
                      child: Text("Download Receipt",
                        style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
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
    var path = Path()
    ..lineTo(0, 0)
    ..lineTo(0, size.height * 0.40)
    ..quadraticBezierTo(24.0, size.height * 0.45, 0, size.height * 0.50)
    ..lineTo(0, size.height)
    ..lineTo(size.width, size.height)
    ..lineTo(size.width, size.height * 0.50)
    ..quadraticBezierTo(size.width - 24.0, size.height * 0.45, size.width, size.height * 0.40)
    ..lineTo(size.width, 0)
    ..lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}