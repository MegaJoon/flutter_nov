import 'package:flutter/material.dart';

// https://dribbble.com/shots/8257559-Movie-2-0

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  List<String> imagelist = [
    "https://cdn.pixabay.com/photo/2019/11/06/14/33/moon-4606246__340.jpg",
    "https://cdn.pixabay.com/photo/2019/02/28/10/28/beverage-4025703__340.jpg",
    "https://cdn.pixabay.com/photo/2019/09/16/17/28/cat-4481566__340.jpg",
    "https://cdn.pixabay.com/photo/2019/11/02/01/15/dj-4595492__340.jpg",
    "https://cdn.pixabay.com/photo/2018/03/07/16/37/pink-flamingo-3206415__340.jpg"
  ];

  // main
  PageController pageController;

  int currentPage = 0;

  double pageControllerPage = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: currentPage, viewportFraction: 0.80);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imagelist.length,
                reverse: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(imagelist[index]),
                          fit: BoxFit.fill),
                    ),
                  );
                }),
          ),
          Positioned(
            top: 400.0,
            left: 0,
            right: 0,
            bottom: 24.0,
            child: Container(
              padding: EdgeInsets.only(top: 24.0),
              color: Colors.red,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imagelist.length,
                  controller: pageController,
                  onPageChanged: (pageIdx) {
                    currentPage = pageIdx;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 24.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imagelist[index]),
                            fit: BoxFit.fill),
                      ),
                      child: Center(
                        child: Text(
                          index.toString(),
                          style: TextStyle(
                              fontSize: 100.0,
                              color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.bold),
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
