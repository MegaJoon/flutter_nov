import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class SecondYakuza extends StatefulWidget {
  @override
  _SecondYakuzaState createState() => _SecondYakuzaState();
}

class _SecondYakuzaState extends State<SecondYakuza> {
  // titles
  String title1 = "Dish of the day";
  String title2 = "Popular dishes";
  String ramen = "Hokusai\nRamen";

  Color _color = Color.fromRGBO(255, 197, 9, 1);

  String _image = "assets/yakuza2.png";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // appbar
          _buildAppbar(),

          // dish of the day container
          _buildContainer1(),

          // popular dishes
          _buildContainer2(),
        ],
      ),
    );
  }

  _buildAppbar(){
    return SafeArea(
      top: true,
      left: true,
      right: true,
      child: Container(
        margin: EdgeInsets.only(right: 40.0),
        height: 32.0,
        child: Row(
          children: <Widget>[
            // on clicked : pop page
            IconButton(
              onPressed: (){
                setState(() {
                  Navigator.pop(context);
                });
              },
              icon: Icon(Icons.arrow_back_ios, size: 28.0, color: Colors.black),
            ),

            Spacer(),

            Icon(Icons.search, size: 28.0, color: Colors.black),

            SizedBox(width: 24.0),

            Badge(
              showBadge: true,
              position: BadgePosition.topRight(top: -5, right: -5),
              badgeContent: Text("1",
                style: TextStyle(fontSize: 8.0, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              child: Icon(Icons.card_travel, size: 28.0, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  _buildContainer1(){
    return Container(
      margin: EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
      height: 250.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title1,
          style: TextStyle(
            fontSize: 28.0, color: Colors.black, fontWeight: FontWeight.w600),
          ),

          Flexible(
            fit: FlexFit.tight,
            child: Stack(
              children: <Widget>[
                // left
                Positioned(
                  top: 32.0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(24.0),
                    width: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: _color,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(ramen,
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                        ),

                        RichText(text: TextSpan(children: [
                          TextSpan(text: "\$", style: TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.w600),),
                          TextSpan(text: "10", style: TextStyle(fontSize: 32.0, color: Colors.white, fontWeight: FontWeight.bold),),
                        ]),
                        ),
                      ],
                    ),
                  ),
                ),

                // image
                Positioned(
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.asset(_image, fit: BoxFit.cover, width: 250.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildContainer2(){
    return Container(
      margin: EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
      height: 400.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title2,
            style: TextStyle(
                fontSize: 28.0, color: Colors.black, fontWeight: FontWeight.w600),
          ),

          Flexible(
            fit: FlexFit.tight,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(top: 24.0),
              children: <Widget>[
                // list 1. ramen
                Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                  height: 100.0,
                  child: Stack(
                    children: <Widget>[
                      // background container
                      Positioned(
                        top: 16.0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: EdgeInsets.only(left: 150.0, right: 16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(color: Colors.grey, width: 1.0),
                          ),
                          child: Row(
                            children: <Widget>[
                              Text("Ramen",
                                style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w600),
                              ),

                              Spacer(),

                              RichText(text: TextSpan(children: [
                                TextSpan(text: "\$", style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w600),),
                                TextSpan(text: "6.00", style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w600),),
                              ]),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // image
                      Positioned(
                        top: 0,
                        left: 16.0,
                        bottom: 16.0,
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            image: DecorationImage(
                              image: AssetImage("assets/ramen.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
//                          child: Placeholder(),
                        ),
                      ),
                    ],
                  ),
                ),

                // list 2. sashimi
                Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                  height: 100.0,
                  child: Stack(
                    children: <Widget>[
                      // background container
                      Positioned(
                        top: 16.0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: EdgeInsets.only(left: 150.0, right: 16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(color: Colors.grey, width: 1.0),
                          ),
                          child: Row(
                            children: <Widget>[
                              Text("Sashimi",
                                style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w600),
                              ),

                              Spacer(),

                              RichText(text: TextSpan(children: [
                                TextSpan(text: "\$", style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w600),),
                                TextSpan(text: "8.00", style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w600),),
                              ]),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // image
                      Positioned(
                        top: 0,
                        left: 16.0,
                        bottom: 16.0,
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            image: DecorationImage(
                              image: AssetImage("assets/sashimi.jfif"),
                              fit: BoxFit.fill,
                            ),
                          ),
//                          child: Placeholder(),
                        ),
                      ),
                    ],
                  ),
                ),

                // list 3. rolls
                Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                  height: 100.0,
                  child: Stack(
                    children: <Widget>[
                      // background container
                      Positioned(
                        top: 16.0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: EdgeInsets.only(left: 150.0, right: 16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(color: Colors.grey, width: 1.0),
                          ),
                          child: Row(
                            children: <Widget>[
                              Text("Rolls",
                                style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w600),
                              ),

                              Spacer(),

                              RichText(text: TextSpan(children: [
                                TextSpan(text: "\$", style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w600),),
                                TextSpan(text: "5.00", style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w600),),
                              ]),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // image
                      Positioned(
                        top: 0,
                        left: 16.0,
                        bottom: 16.0,
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            image: DecorationImage(
                              image: AssetImage("assets/rolls.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
//                          child: Placeholder(),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}















