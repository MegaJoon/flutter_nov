import 'package:flutter/material.dart';
import 'package:flutter_nov/1128/biutimi_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondBiutimi extends StatefulWidget {
  final int index;

  SecondBiutimi(this.index);

  @override
  _SecondBiutimiState createState() => _SecondBiutimiState();
}

class _SecondBiutimiState extends State<SecondBiutimi> {
  double padding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // appbar
            Container(
              height: 48.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 100.0,
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, size: 28.0, color: Colors.black),
                    ),
                  ),

                  Image.asset("assets/blu/biu_icon.png", fit: BoxFit.contain),

                  Container(
                    width: 100.0,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.share, size: 28.0, color: Colors.black),
                        ),

                        IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.favorite_border, size: 28.0, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // top container
            Flexible(
              flex: 2,
              child: Stack(
                children: <Widget>[
                  // background image
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: padding,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(biutimiList[widget.index].image),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            right: padding,
                            bottom: padding,
                            child: Container(
                              height: 32.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Colors.white.withOpacity(0.4),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(Icons.photo, size: 24.0, color: Colors.white),
                                  Text("Gallery",
                                  style: TextStyle(
                                    fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w400,
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // circle image
                  Positioned(
                    left: padding *2,
                    bottom: 0,
                    child: Hero(
                      tag: "index ${widget.index}",
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(biutimiList[widget.index].image),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 2,
                          )],
                        ),
//                      child: Placeholder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // bottom container
            Flexible(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(top: padding, left: padding, right: padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // name
                    Text(biutimiList[widget.index].name,
                    style: TextStyle(
                      fontSize: 28.0, color: Colors.black, fontWeight: FontWeight.bold,
                    ),
                    ),

                    // recognize
                    Row(
                      children: <Widget>[
                        Container(
                          height: 32.0,
                          width: 120.0,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 0,
                                left: 20.0,
                                bottom: 0,
                                child: Container(
                                  width: 32.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage("https://cdn.pixabay.com/photo/2019/11/06/15/49/redheads-4606477__340.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                    boxShadow: [BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    )],
                                  ),
                                ),
                              ),

                              // star icon
                              Positioned(
                                top: 0,
                                left: 0,
                                bottom: 0,
                                child: Container(
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
                                ),
                              ),

                              Positioned(
                                top: 0,
                                left: 40.0,
                                bottom: 0,
                                child: Container(
                                  width: 32.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage("https://cdn.pixabay.com/photo/2017/07/31/11/22/people-2557408__340.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                    boxShadow: [BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    )],
                                  ),
                                ),
                              ),

                              Positioned(
                                top: 0,
                                left: 60.0,
                                bottom: 0,
                                child: Container(
                                  width: 32.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage("https://cdn.pixabay.com/photo/2016/12/23/07/58/holiday-table-1926946__340.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                    boxShadow: [BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    )],
                                  ),
                                ),
                              ),

                              Positioned(
                                top: 0,
                                left: 80.0,
                                bottom: 0,
                                child: Container(
                                  width: 32.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.deepPurple,
                                    boxShadow: [BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    )],
                                  ),
                                  child: Center(
                                      child: Text("32",
                                      style: TextStyle(
                                        fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Spacer(),

                        Text("recognize",
                          style: TextStyle(
                            fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w400,
                          ),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.arrow_forward, size: 20.0, color: Colors.black),
                        ),
                      ],
                    ),

                    // 3 icons
                    Container(
                      height: 230.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // text
                          Text("text",
                            style: TextStyle(
                              fontSize: 20.0, color: Colors.grey, fontWeight: FontWeight.w400,
                            ),
                          ),

                          SizedBox(height: padding),

                          biutimiList[widget.index].tag1? Container(
                            height: 60.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                // icon + text
                                Row(
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.handScissors, size: 24.0, color: Colors.grey),

                                    SizedBox(width: 4.0),

                                    Text("Hair styling",
                                    style: TextStyle(
                                      fontSize: 16.0, color: Colors.black87, fontWeight: FontWeight.w600,
                                    ),
                                    ),
                                  ],
                                ),

                                // text
                                Text("ABCDEFGHIJKLMNOPQRSTUVWXYZ",
                                  style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ) : Container(),
                          biutimiList[widget.index].tag2? Container(
                            height: 60.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                // icon + text
                                Row(
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.lemon, size: 24.0, color: Colors.grey),

                                    SizedBox(width: 4.0),

                                    Text("Lemon 22",
                                    style: TextStyle(
                                      fontSize: 16.0, color: Colors.black87, fontWeight: FontWeight.w600,
                                    ),
                                    ),
                                  ],
                                ),

                                // text
                                Text("ABCDEFGHIJKLMNOPQRSTUVWXYZ",
                                  style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ) : Container(),
                          biutimiList[widget.index].tag3? Container(
                            height: 60.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                // icon + text
                                Row(
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.codepen, size: 24.0, color: Colors.grey),

                                    SizedBox(width: 4.0),

                                    Text("Codepen 33",
                                    style: TextStyle(
                                      fontSize: 16.0, color: Colors.black87, fontWeight: FontWeight.w600,
                                    ),
                                    ),
                                  ],
                                ),

                                // text
                                Text("ABCDEFGHIJKLMNOPQRSTUVWXYZ",
                                  style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ) : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
