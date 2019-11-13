import 'package:flutter/material.dart';

// https://dribbble.com/shots/8171324-Travel-Community-App/attachments/569173?mode=media

class TravelCommunityApp extends StatefulWidget {
  @override
  _TravelCommunityAppState createState() => _TravelCommunityAppState();
}

class _TravelCommunityAppState extends State<TravelCommunityApp> {
  // background image
  String _backgroundImage = "assets/scenery.jpg";

  // text
  String title = "Travelers";
  String subTitle = "Travel community app";

  Color _color = Color.fromRGBO(255, 101, 37, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 80.0,
            child: Container(
              padding: EdgeInsets.only(top: 100.0, left: 24.0, right: 24.0, bottom: 16.0),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(_backgroundImage), fit: BoxFit.fill),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // title
                  Text(title,
                  style: TextStyle(fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.bold),
                  ),

                  // subtitle
                  Text(subTitle,
                    style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600, height: 2.0),
                  ),

                  Spacer(),

                  // container
                  Container(
                    height: 300.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        // email
                        Container(
                          margin: EdgeInsets.only(bottom: 16.0),
                          height: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.black.withOpacity(0.5)
                          ),
                          child: Row(
                            children: <Widget>[
                              // icon
                              Flexible(
                                flex: 2,
                                child: Center(
                                    child: Icon(Icons.mail_outline, size: 32.0, color: _color.withOpacity(0.5),
                                    ),
                                ),
                              ),

                              // divider
                              Container(
                                margin: EdgeInsets.only(top: 8.0, bottom: 8.0, right: 16.0),
                                height: 64.0,
                                width: 1.0,
                                color: Colors.white12,
                              ),

                              // e-mail
                              Flexible(
                                flex: 9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text("E-mail",
                                      style: TextStyle(fontSize: 14.0, color: _color.withOpacity(0.5), fontWeight: FontWeight.w600),
                                    ),

                                    Text("sajon@asfcasccas.com",
                                      style: TextStyle(fontSize: 14.0, color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // password
                        Container(
                          margin: EdgeInsets.only(bottom: 16.0),
                          height: 80.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Colors.black.withOpacity(0.5)
                          ),
                          child: Row(
                            children: <Widget>[
                              // icon
                              Flexible(
                                flex: 2,
                                child: Center(
                                  child: Icon(Icons.lock_outline, size: 32.0, color: _color.withOpacity(0.5),
                                  ),
                                ),
                              ),

                              // divider
                              Container(
                                margin: EdgeInsets.only(top: 8.0, bottom: 8.0, right: 16.0),
                                height: 64.0,
                                width: 1.0,
                                color: Colors.white12,
                              ),

                              // password
                              Flexible(
                                flex: 8,
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text("Password",
                                          style: TextStyle(fontSize: 14.0, color: _color.withOpacity(0.5), fontWeight: FontWeight.w600),
                                        ),

                                        Text("kfg%ksncsk",
                                          style: TextStyle(fontSize: 14.0, color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),

                                    Spacer(),

                                    Icon(Icons.visibility, size: 16.0, color: Colors.white12),

                                    SizedBox(width: 24.0),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Text("Forgot Password",
                        style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  Spacer(),
                  //
                  Text("Don't have an account?",
                    style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600),
                  ),

                  Text("create now",
                    style: TextStyle(fontSize: 14.0, color: _color, fontWeight: FontWeight.bold, height: 2.0),
                  ),
                ],
              ),
            ),
          ),

          // bottom login text
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80.0,
              color: _color,
              child: Center(
                  child: Text("Log In",
                  style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
