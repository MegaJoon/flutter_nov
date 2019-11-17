import 'package:flutter/material.dart';

class AddNewCardPage extends StatefulWidget {
  @override
  _AddNewCardPageState createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> with SingleTickerProviderStateMixin {
  double padding = 24.0;

  AnimationController _controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 1000),vsync: this);
    animation = Tween<double>(begin: 0, end: 1)
        .chain(CurveTween(curve: Curves.fastOutSlowIn))
        .animate(_controller)
      ..addListener(() {
        setState(() {
        });
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            setState(() {});
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 28.0, color: Colors.black),
        ),
        centerTitle: true,
        title: Text(
          "Select Card",
          style: TextStyle(
              fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),

      // body
      body: Container(
        padding: EdgeInsets.all(padding),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -500 * (animation.value - 1),
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: padding),
                height: 400.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //
                    Container(
                      padding: EdgeInsets.all(padding * 0.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        gradient: LinearGradient(
                            colors: [Colors.blueAccent.withOpacity(0.8),
                              Colors.blueAccent.withOpacity(0.5),
                              Colors.blueAccent,
                              Colors.blueAccent,
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft
                        ),
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 1
                        )]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Spacer(),

                              Text("VISA".toUpperCase(),
                                style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 8.0),
                                height: 32.0,
                                width: 55.0,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        width: 32.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      bottom: 0,
                                      child: Container(
                                        width: 32.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),

                                    Align(
                                      alignment: Alignment.center,
                                      child: Text("Mstercard".toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 8.0, color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Text("Card Number*", style: TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.w600),),

                          Container(
                            margin: EdgeInsets.only(top: 8.0, right: 8.0, bottom: 16.0),
                            padding: EdgeInsets.all(8.0),
                            height: 40.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.black12,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("xxxx", style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600),),
                                Text("xxxx", style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600),),
                                Text("xxxx", style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600),),
                                Text("xxxx", style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600),),
                              ],
                            ),
                          ),

                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 200.0,
                                child: Text("Card Holder Name*",
                                  style: TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.w600),),
                              ),

                              SizedBox(width: 8.0),
                              Text("Expiry Date*",
                                style: TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.w600),),
                            ],
                          ),

                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 8.0, right: 8.0),
                                padding: EdgeInsets.all(8.0),
                                height: 40.0,
                                width: 200.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.black12,
                                ),
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Card Holder Name",
                                      style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 8.0),
                                    padding: EdgeInsets.all(4.0),
                                    height: 40.0,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.black12,
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text("11",
                                          style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600),
                                        ),

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Icon(Icons.arrow_drop_up, size: 16.0, color: Colors.white),
                                            Icon(Icons.arrow_drop_down, size: 16.0, color: Colors.white),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(width: 8.0),

                                  Container(
                                    margin: EdgeInsets.only(top: 8.0),
                                    padding: EdgeInsets.all(4.0),
                                    height: 40.0,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.black12,
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text("19",
                                          style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600),
                                        ),

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Icon(Icons.arrow_drop_up, size: 16.0, color: Colors.white),
                                            Icon(Icons.arrow_drop_down, size: 16.0, color: Colors.white),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),


            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: InkWell(
                onTap: (){
                  setState(() {});
                  Navigator.pop(context);
                },
                child: Container(
                  height: 64.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.deepPurpleAccent
                  ),
                  child: Center(
                    child: Text("Save",
                      style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
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
