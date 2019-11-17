import 'package:flutter/material.dart';
import 'package:flutter_nov/1117/add_new_card_page.dart';
import 'package:flutter_nov/1117/processing_page.dart';

class SelectCardPage extends StatefulWidget {
  @override
  _SelectCardPageState createState() => _SelectCardPageState();
}

class _SelectCardPageState extends State<SelectCardPage> {
  double padding = 24.0;

  int _currentIndex = 0;

  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.60);

  List<Color> color = [
    Colors.blueAccent,
    Colors.deepPurpleAccent,
    Colors.amber,
    Colors.indigo
  ];

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
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
        margin: EdgeInsets.only(top: padding),
//        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // card
            Container(
                padding: EdgeInsets.only(bottom: padding),
                height: 200.0,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: pageController,
                  physics: BouncingScrollPhysics(),
                  itemCount: color.length,
                  onPageChanged: (int currentIndex) {
                    setState(() {
                      _currentIndex = currentIndex;
                      print("_currentIndex = $_currentIndex");
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Transform.translate(
                      offset: Offset(-padding * 2, 0.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: padding),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              //
                              Container(
                                height: 150.0,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      top: 12.0,
                                      left: 0,
                                      right: 12.0,
                                      bottom: 0,
                                      child: Hero(
                                        tag: "card $index",
                                        flightShuttleBuilder: (
                                            BuildContext flightContext,
                                            Animation<double> animation,
                                            HeroFlightDirection flightDirection,
                                            BuildContext fromHeroContext,
                                            BuildContext toHeroContext,
                                            ) {
                                          Animation<double> newAnimation =
                                          Tween<double>(begin: 0, end: 1.0)
                                              .animate(animation);

                                          if (flightDirection ==
                                              HeroFlightDirection.pop) {
                                            newAnimation =
                                                ReverseAnimation(newAnimation);
                                          }

                                          return RotationTransition(
                                            turns: newAnimation,
                                            child: toHeroContext.widget,
                                          );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(padding * 0.5),
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            gradient: LinearGradient(
                                                colors: [
                                                  color[index].withOpacity(0.8),
                                                  color[index].withOpacity(0.5),
                                                  color[index],
                                                  color[index],
                                                ],
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                  "VISA".toUpperCase(),
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontStyle:
                                                          FontStyle.italic),
                                                ),
                                              ),
                                              Image.asset("assets/sim_card.png",
                                                  height: 32.0,
                                                  fit: BoxFit.fitHeight),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    "2671",
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    "9860",
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    "8300",
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    "0202",
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "11/19",
                                                  style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              Text(
                                                "Sketch app sources"
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    isSelected
                                        ? Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Icon(Icons.check_circle,
                                                size: 32.0,
                                                color: Colors.deepPurpleAccent),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),

                              _currentIndex == index
                                  ? Container(
                                      margin: EdgeInsets.only(
                                          top: 12.0, left: 8.0, right: 8.0),
                                      height: 14.0,
                                      decoration: ShapeDecoration(
                                        shape: StadiumBorder(),
                                        gradient: LinearGradient(
                                            colors: [
                                              Colors.grey[50],
                                              Colors.grey[300],
                                              Colors.grey[50],
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddNewCardPage()));
              },
              child: Container(
                height: 40.0,
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.add,
                          size: 16.0, color: Colors.deepPurpleAccent),
                      Text(
                        "Add New Card",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: padding),

            // orders
            Container(
              margin: EdgeInsets.symmetric(horizontal: padding),
              height: 200.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Orders",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Subtotal (4 items)",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      Text(
                        "\$31",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.green,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Coupon discount",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      Text(
                        "-\$5",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.red,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Divider(height: 2.0, color: Colors.black54),
                  Row(
                    children: <Widget>[
                      Text(
                        "Delivery Charges",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      Text(
                        "+\$3",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Divider(height: 2.0, color: Colors.black54),
                  Row(
                    children: <Widget>[
                      Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      Text(
                        "\$29",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.0),
                  Text(
                    "Recipient Details",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "777 Brockton Avenue, Abington MA 2351.",
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "+1 (404) 960-3807",
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),

            Spacer(),

            // bottom
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProcessingPage(_currentIndex)));
              },
              child: Container(
                margin: EdgeInsets.only(
                    left: padding, right: padding, bottom: padding),
                height: 64.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.deepPurpleAccent),
                child: Center(
                  child: Text(
                    "Pay",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
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
