import 'package:flutter/material.dart';
import 'package:flutter_nov/1128/blu_item_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemDetailPage extends StatefulWidget {
  final int index;

  ItemDetailPage(this.index);

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  double padding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Column(
          children: <Widget>[
            // appbar
            Container(
              height: 52.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 100.0,
                    child: IconButton(
                      onPressed: () {
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
                          onPressed: () {},
                          icon: Icon(Icons.share, size: 28.0, color: Colors.black),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border, size: 28.0, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // top image
            Flexible(
              flex: 2,
              child: Stack(
                children: <Widget>[
                  // image
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: padding * 2,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(bluList[widget.index].background),
                          fit: BoxFit.fill,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 1,
                          )
                        ],
                      ),
                    ),
                  ),

                  // circle image
                  Positioned(
                    left: padding * 2,
                    bottom: 2.0,
                    child: Hero(
                      tag: "item ${widget.index}",
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(bluList[widget.index].profileImage),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 1,
                            )
                          ],
                        ),
//                      child: Placeholder(),
                      ),
                    ),
                  ),

                  // gallery
                  Positioned(
                    right: padding * 2,
                    bottom: padding * 3,
                    child: Container(
                      height: 40.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.white.withOpacity(0.3),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.photo, size: 24.0, color: Colors.white),
                          Text(
                            "Gallery",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // bottom image
            Flexible(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(height: 8.0),
                    // name
                    Text(
                      bluList[widget.index].name,
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // recognize
                    Container(
                      margin: EdgeInsets.only(top: padding, bottom: padding),
                      height: 32.0,
                      child: Row(
                        children: <Widget>[
                          // other people
                          Container(
                            width: 120.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  top: 5.0,
                                  left: 20.0,
                                  bottom: 5.0,
                                  child: Container(
                                    width: 24.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage("https://cdn.pixabay.com/photo/2019/11/06/15/49/redheads-4606477__340.jpg"),
                                        fit: BoxFit.fill,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  bottom: 0,
                                  child: Container(
                                    width: 32.0,
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned.fill(
                                          child: Center(
                                            child: Icon(Icons.star, size: 32.0, color: Colors.yellow),
                                          ),
                                        ),
                                        Positioned.fill(
                                          child: Center(
                                            child: Text(
                                              "5",
                                              style: TextStyle(
                                                fontSize: 8.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 5.0,
                                  left: 36.0,
                                  bottom: 5.0,
                                  child: Container(
                                    width: 24.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage("https://cdn.pixabay.com/photo/2019/10/27/18/48/new-york-4582500__340.jpg"),
                                        fit: BoxFit.fill,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 5.0,
                                  left: 52.0,
                                  bottom: 5.0,
                                  child: Container(
                                    width: 24.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage("https://cdn.pixabay.com/photo/2019/11/12/15/47/aesthetic-4621334__340.jpg"),
                                        fit: BoxFit.fill,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 5.0,
                                  left: 68.0,
                                  bottom: 5.0,
                                  child: Container(
                                    width: 24.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.deepPurple,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                        )
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        "32",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Spacer(),

                          // icon arrow
                          Text(
                            "recognize",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_forward, size: 20.0, color: Colors.black),
                          ),
                        ],
                      ),
                    ),

                    // text
                    Text(
                      "text",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    // hair styling
                    Container(
                      height: 200.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          bluList[widget.index].tag1? Container(
                                  margin: EdgeInsets.only(bottom: padding),
                                  height: 50.0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(FontAwesomeIcons.handScissors, size: 16.0, color: Colors.grey),
                                          SizedBox(width: 8.0),
                                          Text(
                                            "Hair styling",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "How can i make custom marker..",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),

                          bluList[widget.index].tag2? Container(
                            margin: EdgeInsets.only(bottom: padding),
                            height: 50.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.lemon, size: 16.0, color: Colors.grey),
                                    SizedBox(width: 8.0),
                                    Text(
                                      "Food",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "How can i make custom marker..@",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          )
                              : Container(),

                          bluList[widget.index].tag3? Container(
                            margin: EdgeInsets.only(bottom: padding),
                            height: 50.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.codepen, size: 16.0, color: Colors.grey),
                                    SizedBox(width: 8.0),
                                    Text(
                                      "Perfume",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "How can i make custom marker..#",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          )
                              : Container(),
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
