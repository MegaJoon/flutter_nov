import 'package:flutter/material.dart';
import 'package:flutter_nov/1116/myTab.dart';
import 'package:flutter_nov/1116/order_page.dart';
import 'package:flutter_nov/1116/product_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// https://dribbble.com/shots/8231607-Delivery-App

class DeliveryApp extends StatefulWidget {
  @override
  _DeliveryAppState createState() => _DeliveryAppState();
}

class _DeliveryAppState extends State<DeliveryApp> {
  // tabbarview item list
  List<Widget> pages;

  // tabbar index
  int _currentIndex = 0;

  // pageview index
  int _selectedIndex = 0;

  double padding = 24.0;

  void _onPressed(int num) {
    setState(() {
      _currentIndex = num;
      print("_currentIndex = $_currentIndex");
    });
  }

  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.80);

  @override
  Widget build(BuildContext context) {
    _definePages();

    return Scaffold(
      // appbar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(52.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back, size: 28.0, color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person_outline, size: 28.0, color: Colors.black),
            ),
          ],
        ),
      ),

      body: Column(
        children: <Widget>[
          // tabbar
          _buildTabbar(),

          // tabbarview
          _buildTabbarView(),
        ],
      ),
    );
  }

  _buildTabbar() {
    return Container(
      height: 52.0,
      color: Colors.white,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: <Widget>[
          MyTab(
            text: "Fruits",
            isSelected: _currentIndex == 0,
            onPressed: () {
              setState(() {
                _onPressed(0);
              });
            },
          ),
          MyTab(
            text: "Vegetables",
            isSelected: _currentIndex == 1,
            onPressed: () {
              setState(() {
                _onPressed(1);
              });
            },
          ),
          MyTab(
            text: "Coffees",
            isSelected: _currentIndex == 2,
            onPressed: () {
              setState(() {
                _onPressed(2);
              });
            },
          ),
          MyTab(
            text: "IceCreams",
            isSelected: _currentIndex == 3,
            onPressed: () {
              setState(() {
                _onPressed(3);
              });
            },
          ),
          MyTab(
            text: "Coffees",
            isSelected: _currentIndex == 4,
            onPressed: () {
              setState(() {
                _onPressed(4);
              });
            },
          ),
        ],
      ),
    );
  }

  _buildTabbarView() {
    return Flexible(
      fit: FlexFit.tight,
      child: Container(color: Colors.white, child: pages[_currentIndex]),
    );
  }

  _definePages() {
    pages = [
      // initial pages
      Column(
        children: <Widget>[
          // container
          Flexible(
            fit: FlexFit.tight,
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                physics: BouncingScrollPhysics(),
                onPageChanged: (int selectedIndex) {
                  setState(() {
                    _selectedIndex = selectedIndex;
                  });
                },
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.tight,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OrderPage(index)));
                                  });
                                },
                                child: Transform.translate(
                                  offset: Offset(-padding, 0.0),
                                  child: Hero(
                                    // hero color tag
                                    tag: "color $index",
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: padding,
                                          right: padding,
                                          bottom: padding),
                                      padding: EdgeInsets.all(padding),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                        gradient: LinearGradient(
                                          colors: [
                                            productList[index]
                                                .color
                                                .withOpacity(0.6),
                                            productList[index]
                                                .color
                                                .withOpacity(0.7),
                                            productList[index].color
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: padding * 2,
                              left: 0,
                              right: padding * 3,
                              bottom: padding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // tag
                                  Text(
                                    productList[index].tag,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),

                                  SizedBox(height: padding / 2),

                                  // title
                                  Text(
                                    productList[index].title,
                                    style: TextStyle(
                                        fontSize: 26.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),

                                  Spacer(),

                                  // image
                                  Hero(
                                      tag: "image $index",
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
                                      child: Image.asset(
                                          productList[index].image,
                                          fit: BoxFit.contain)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // bottom text
                      Container(
                        margin: EdgeInsets.only(
                            right: padding * 2, bottom: padding * 2),
                        height: 100.0,
                        child: _selectedIndex == index
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  // first line
                                  Flexible(
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          productList[_selectedIndex].market,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Icon(FontAwesomeIcons.clock,
                                            size: 14.0, color: Colors.black),
                                        SizedBox(width: 4.0),
                                        Text(
                                          productList[_selectedIndex].distance,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Divider(height: 1.0, color: Colors.black54),

                                  // second line
                                  Flexible(
                                    child: Text(
                                      "Caloris :",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),

                                  Divider(height: 1.0, color: Colors.black54),

                                  // third line
                                  Flexible(
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          productList[_selectedIndex].grams,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Spacer(),
                                        Icon(FontAwesomeIcons.clock,
                                            size: 14.0, color: Colors.black),
                                        SizedBox(width: 4.0),
                                        Text(
                                          productList[_selectedIndex].kcal,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),

      // dont use;
      Placeholder(color: Colors.indigo),
      Placeholder(color: Colors.green),
      Placeholder(color: Colors.amber),
      Placeholder(color: Colors.pinkAccent),
    ];
  }
}
