import 'dart:ui';

import 'package:flutter/material.dart';

// https://dribbble.com/shots/8257559-Movie-2-0
// https://medium.com/flutter-community/synchronising-widget-animations-with-the-scroll-of-a-pageview-in-flutter-2f3475fcffa3

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  // padding
  double padding = 24.0;

  ValueNotifier<double> notifier;

  // pageview controller
  PageController pageController;

  // pageview page index
  int _currentIndex = 2;

  // detect scroll value in pageview
  void _onScroll() {
    notifier.value = pageController.page;
    print("notifier.value = ${notifier.value}");
    onChanged(notifier.value * MediaQuery.of(context).size.width);
  }

  // listview scrollcontroller
  ScrollController scrollController;

  // listview move
  void onChanged(double position) {
    setState(() {
      scrollController.animateTo(position,
          duration: Duration(microseconds: 500), curve: Curves.fastOutSlowIn);
    });
  }

  @override
  void initState() {
    notifier = ValueNotifier<double>(0);

    pageController = PageController(initialPage: 2, viewportFraction: 0.70)
      ..addListener(_onScroll);

    scrollController = ScrollController(initialScrollOffset: 2 * 410.0);
    super.initState();
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // bkacground image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: screenHeight * 0.30,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: movieList.length,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                controller: scrollController,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.bottomCenter,
                    height: screenHeight,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(index == 2
                            ? "assets/joker_background.jpg"
                            : movieList[index].image),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: ClipRect(
                      child: Container(
                        height: screenHeight * 0.15,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.1),
                                  Colors.white.withOpacity(0.5),
                                  Colors.white
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),

          // appbar
          Positioned(
            top: 0,
            left: padding,
            right: padding,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Container(
                height: 48.0,
                child: Row(
                  children: <Widget>[
                    // close Icon
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.close, size: 24.0, color: Colors.white),
                    ),

                    Spacer(),

                    // circle Icon
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.adjust, size: 24.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //main pageview
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: screenHeight * 0.70,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: movieList.length,
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  onPageChanged: (int currentIndex) {
                    _currentIndex = currentIndex;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Transform.translate(
                      offset: Offset(0.0, _currentIndex == index ? 0.0 : 48.0),
                      child: Container(
                        padding: EdgeInsets.all(padding),
                        margin:
                            EdgeInsets.symmetric(horizontal: padding * 0.50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(48.0),
                            topRight: Radius.circular(48.0),
                          ),
                          color: _currentIndex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.8),
                        ),
                        child: Column(
                          children: <Widget>[
                            // top container - movie image
                            Container(
                              height: 320.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(36.0),
                                image: DecorationImage(
                                  image: AssetImage(movieList[index].image),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),

                            // bottom text
                            Flexible(
                              fit: FlexFit.tight,
                              child: Container(
                                child: _currentIndex == index
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          // title
                                          Text(
                                            movieList[index].title,
                                            style: TextStyle(
                                                fontSize: 28.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),

                                          // 3 genre - containers
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Container(
                                                height: 16.0,
                                                width: 64.0,
                                                decoration: ShapeDecoration(
                                                  shape: StadiumBorder(
                                                    side: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Genre",
                                                    style: TextStyle(
                                                        fontSize: 10.0,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 16.0,
                                                width: 64.0,
                                                decoration: ShapeDecoration(
                                                  shape: StadiumBorder(
                                                    side: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Genre",
                                                    style: TextStyle(
                                                        fontSize: 10.0,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 16.0,
                                                width: 64.0,
                                                decoration: ShapeDecoration(
                                                  shape: StadiumBorder(
                                                    side: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Genre",
                                                    style: TextStyle(
                                                        fontSize: 10.0,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          // score
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: padding * 2),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text(
                                                  "9.0",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Icon(Icons.star,
                                                    size: 14.0,
                                                    color: Colors.deepOrange),
                                                Icon(Icons.star,
                                                    size: 14.0,
                                                    color: Colors.deepOrange),
                                                Icon(Icons.star,
                                                    size: 14.0,
                                                    color: Colors.deepOrange),
                                                Icon(Icons.star,
                                                    size: 14.0,
                                                    color: Colors.deepOrange),
                                                Icon(Icons.star_border,
                                                    size: 14.0,
                                                    color: Colors.grey),
                                              ],
                                            ),
                                          ),

                                          // 3 star - what's it?
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(Icons.star,
                                                  size: 8.0,
                                                  color: Colors.black),
                                              SizedBox(width: 4.0),
                                              Icon(Icons.star,
                                                  size: 8.0,
                                                  color: Colors.black),
                                              SizedBox(width: 4.0),
                                              Icon(Icons.star,
                                                  size: 8.0,
                                                  color: Colors.black),
                                            ],
                                          ),

                                          // buy ticket - container
                                          Container(
                                            height: 52.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              color: Colors.black,
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Buy ticket".toUpperCase(),
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class MovieList {
  String image;
  String title;

  MovieList({this.image, this.title});
}

List<MovieList> movieList = [
  MovieList(image: "assets/aladin.jpg", title: "Aladin"),
  MovieList(image: "assets/good_boys.jpg", title: "Good Boys"),
  MovieList(image: "assets/joker.jpg", title: "Joker"),
  MovieList(image: "assets/the_hustle.jpg", title: "The Hustle"),
  MovieList(image: "assets/avengers.jpg", title: "Avengers"),
];
