import 'package:flutter/material.dart';
import 'package:flutter_nov/1127/blend_page.dart';
import 'package:flutter_nov/1127/custom_tab.dart';
import 'package:flutter_nov/1127/starbuck_list.dart';

// https://dribbble.com/shots/8518052-Starbucks-Order-Mobile-App/attachments/801230?mode=media

class StarbucksApp extends StatefulWidget {
  @override
  _StarbucksAppState createState() => _StarbucksAppState();
}

class _StarbucksAppState extends State<StarbucksApp> {
  List<Widget> pages;

  double padding = 16.0;

  // color list
  Color _tabColor = Color.fromRGBO(224, 237, 233, 1);
  Color _list1Color = Color.fromRGBO(30, 57, 50, 1);
  Color _list2Color = Color.fromRGBO(197, 40, 54, 1);
  Color _list3Color = Color.fromRGBO(0, 112, 74, 1);

  String title = "Starbucks";

  int currentIndex = 1; // tab index

  void _onPressed(int num) {
    setState(() {
      currentIndex = num;
      print("currentIndex = $currentIndex");
    });
  }

  @override
  Widget build(BuildContext context) {
    _definePage();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Stack(
        children: <Widget>[
          // topRight image
          Positioned(
            top: -50.0,
            left: 0,
            right: -100.0,
            child: Image.asset(
              "assets/starbucks/background_image.png",
              height: 250.0,
              fit: BoxFit.cover,
            ),
          ),

          // appbar
          Positioned(
            top: padding * 0.5,
            left: padding,
            right: padding,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Container(
                height: 40.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // shopping bag icon in container
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.shopping_basket,
                          size: 20.0,
                          color: _list1Color,
                        ),
                      ),
                    ),

                    // title text
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "gibson-bold",
                      ),
                    ),

                    // spacer
                    Container(
                      height: 40.0,
                      width: 40.0,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // white container
          Positioned(
            top: 180.0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(40.0)),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  // text
                  Container(
                    margin: EdgeInsets.only(top: padding, left: padding * 3, right: padding),
                    height: 52.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Skip the line, order now.",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: _list1Color,
                                fontWeight: FontWeight.w400,
                                fontFamily: "gibson-bold",
                              ),
                            ),
                            Text(
                              "99 Kingsway, Holborn, London",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: _tabColor,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Gibson-Regular",
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.search, size: 24.0, color: _list1Color),
                      ],
                    ),
                  ),

                  // main box
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      margin: EdgeInsets.only(top: padding),
                      child: Row(
                        children: <Widget>[
                          // tabbar
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(40.0)),
                                color: _tabColor,
                              ),
                              child: Center(
                                child: ListView(
                                  padding: EdgeInsets.only(top: padding),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    CustomTab(
                                        text: "Taste",
                                        isSelected: currentIndex == 0,
                                        onPressed: () {
                                          setState(() {
                                            _onPressed(0);
                                          });
                                        }),
                                    CustomTab(
                                        text: "Foody",
                                        isSelected: currentIndex == 1,
                                        onPressed: () {
                                          setState(() {
                                            _onPressed(1);
                                          });
                                        }),
                                    CustomTab(
                                        text: "Tea",
                                        isSelected: currentIndex == 2,
                                        onPressed: () {
                                          setState(() {
                                            _onPressed(2);
                                          });
                                        }),
                                    CustomTab(
                                        text: "Coffee",
                                        isSelected: currentIndex == 3,
                                        onPressed: () {
                                          setState(() {
                                            _onPressed(3);
                                          });
                                        }),
                                    CustomTab(
                                        text: "Cream",
                                        isSelected: currentIndex == 4,
                                        onPressed: () {
                                          setState(() {
                                            _onPressed(4);
                                          });
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // tabbar view
                          Flexible(
                            flex: 5,
                            child: pages[currentIndex],
                          ),
                        ],
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

  _definePage() {
    pages = [
      // initial page
      Container(
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: startbucks.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: padding * 3, bottom: padding * 2),
              height: 150.0,
              child: Stack(
                children: <Widget>[
                  // color container
                  Positioned(
                    top: 0,
                    left: 32.0,
                    right: 0,
                    bottom: 32.0,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BlendPage(index)));
                      },
                      child: Container(
                        padding: EdgeInsets.all(padding * 0.8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            bottomLeft: Radius.circular(16.0),
                          ),
                          color: startbucks[index].color,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            // title & icon
                            Row(
                              children: <Widget>[
                                Text(
                                  startbucks[index].title.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Gibson-Regular",
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.favorite_border,
                                  size: 20.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),

                            // subtitle
                            Text(
                              startbucks[index].subTitle,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Gibson-Regular",
                              ),
                            ),

                            Spacer(),

                            // price
                            Text(
                              startbucks[index].price,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Gibson-Regular",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // centerLeft add icon in container
                  Positioned(
                    top: 35.0,
                    left: 0,
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 1,
                          )
                        ],
                      ),
                      child: Center(
                        child: Icon(Icons.add, size: 28.0, color: Colors.black),
                      ),
                    ),
                  ),

                  // bottom right image
                  Positioned(
                    bottom: -20.0,
                    right: -40.0,
                    child: Hero(
                      tag: "starbucks $index",
                      child: Image.asset(
                        startbucks[index].image,
                        fit: BoxFit.cover,
                        height: 180.0,
                        width: 180.0,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),

      // dont use
      Placeholder(color: Colors.amber),
      Placeholder(color: Colors.green),
      Placeholder(color: Colors.indigo),
      Placeholder(color: Colors.deepPurpleAccent),
    ];
  }
}
