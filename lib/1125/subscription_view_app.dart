import 'package:flutter/material.dart';

// https://dribbble.com/shots/8494447-iOS-Subscription-View/attachments/785734?mode=media

class SubscriptionViewApp extends StatefulWidget {
  @override
  _SubscriptionViewAppState createState() => _SubscriptionViewAppState();
}

class _SubscriptionViewAppState extends State<SubscriptionViewApp> {
  String _image = "assets/subscription_image.png";
  String title = "Subscription";

  String text = "How will you keep your\nfamily close?";
  String information = "Bring your family closer together and stay up to date by\nsharing and publishing your stories";

  Color _color = Color.fromRGBO(0, 122, 255, 1);

  double padding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // set backgroundColor
      backgroundColor: Colors.grey[100],

      // keep statusbar
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Column(
          children: <Widget>[
            // appbar
            Container(
              height: 52.0,
              decoration: BoxDecoration(
                color: Colors.white,
                // shadow == elevation
                boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
              ),
              child: Row(
                children: <Widget>[
                  // leading icon & text
                  Flexible(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.arrow_back_ios, size: 24.0, color: _color,),
                        Text("Settings", style: TextStyle(fontSize: 16.0, color: _color, fontWeight: FontWeight.w400),),
                      ],
                    ),
                  ),

                  // center title
                  Flexible(
                    child: Center(
                        child: Text(title, style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),)),
                  ),

                  // dont use
                  Flexible(
                    child: Container(),
                  ),
                ],
              ),
            ),

            // main box
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                children: <Widget>[
                  // image
                  Flexible(
                    flex: 3,
                    child: Center(
                        child: Image.asset(_image, fit: BoxFit.fitWidth),
                    ),
                  ),

                  // text
                  Flexible(
                    flex: 2,
                    child: Center(
                      child: Text(text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32.0, color: Colors.black, fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // selected promotion
                  Flexible(
                    flex: 4,
                    child: Center(
                        child: Column(
                          children: <Widget>[
                            // promotion
                            Flexible(
                              fit: FlexFit.tight,
                              child: Container(
                                margin: EdgeInsets.only(left: padding *0.5, right: padding *0.5, bottom: padding * 0.5),
                                child: Row(
                                  children: <Widget>[
                                    // item 1 : Family Feed
                                    Flexible(
                                      child: Container(
                                        padding: EdgeInsets.all(padding *0.5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0),
                                          color: Colors.white,
                                          boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
                                        ),

                                        child: Center(
                                          child: Column(
                                            children: <Widget>[
                                              Text("Family Feed",
                                                style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),
                                              ),

                                              SizedBox(height: 8.0),

                                              Text("In App Family\nFeed",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600),
                                              ),

                                              Spacer(),

                                              Text("Free",
                                                style: TextStyle(fontSize: 24.0, color: _color, fontWeight: FontWeight.w600),
                                              ),

                                              SizedBox(height: 16.0),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: padding * 0.5),

                                    // item 2 : Newsletter
                                    Flexible(
                                      child: Container(
                                        padding: EdgeInsets.all(padding *0.5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0),
                                          color: Colors.white,
                                          border: Border.all(color: _color, width: 1.0),
                                          boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
                                        ),

                                        child: Center(
                                          child: Column(
                                            children: <Widget>[
                                              Text("Newsletter",
                                                style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),
                                              ),

                                              SizedBox(height: 8.0),

                                              Text("App Feed\nA Monthly E-Mail",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600),
                                              ),

                                              Spacer(),

                                              Text("19 DKK",
                                                style: TextStyle(fontSize: 24.0, color: _color, fontWeight: FontWeight.w600),
                                              ),

                                              Text("Monthly",
                                                style: TextStyle(fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: padding * 0.5),

                                    // item 3 : Magazine
                                    Flexible(
                                      child: Container(
                                        padding: EdgeInsets.all(padding *0.5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0),
                                          color: _color,
                                          boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
                                        ),

                                        child: Center(
                                          child: Column(
                                            children: <Widget>[
                                              Text("Magazine",
                                                style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
                                              ),

                                              SizedBox(height: 8.0),

                                              Text("App Feed\nMonthly E-Mail\n1x Magazine",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.w600),
                                              ),

                                              Spacer(),

                                              Text("99 DKK",
                                                style: TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.w600),
                                              ),

                                              Text("Monthly",
                                                style: TextStyle(fontSize: 12.0, color: Colors.black54, fontWeight: FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // information
                            Text(information,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w400,
                            ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),

            // change container
            InkWell(
              onTap: (){
                print("on clicked!");
              },
              child: Container(
                margin: EdgeInsets.all(padding),
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: _color,
                ),
                child: Center(
                  child: Text("Change",
                  style: TextStyle(
                    fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w400,
                  ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
