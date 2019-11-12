import 'package:flutter/material.dart';
import 'package:flutter_nov/1112/travel_list.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_nov/1112/travel_second_page.dart';

// https://dribbble.com/shots/8122104-Travel-App/attachments/555365?mode=media

class TravelApp extends StatefulWidget {
  @override
  _TravelAppState createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  Color _color = Color.fromRGBO(92, 104, 190, 1);

  int _currentIndex = 0; // pageview index

  PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // pageview.builder
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: PageView.builder(
                itemCount: travelList.length,
                // 3
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                controller: pageController,
                onPageChanged: (int currentIndex) {
                  setState(() {
                    _currentIndex = currentIndex;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return SafeArea(
                    top: true,
                    left: true,
                    right: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // text
                        Flexible(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 40.0, left: 24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // title
                                Text(
                                  travelList[index].title,
                                  style: TextStyle(
                                      fontSize: 32.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),

                                // subtitle
                                Text(
                                  travelList[index].subTitle,
                                  style: TextStyle(
                                      fontSize: 32.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5),
                                ),

                                SizedBox(height: 24.0),
                                // description
                                Text(
                                  travelList[index].description,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5),
                                ),

                                // index == travellist.length
                                index == (travelList.length - 1)
                                    ? InkWell(
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => TravelSecondPage()));
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(top: 32.0),
                                          height: 52.0,
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            color: _color,
                                          ),
                                          // arrow icons
                                          child: Stack(
                                            children: <Widget>[
                                              Positioned(
                                                top: 20.0,
                                                left: 22.0,
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 12.0,
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              Positioned(
                                                top: 18.0,
                                                left: 32.0,
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 16.0,
                                                  color: Colors.white
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                              Positioned(
                                                top: 16.0,
                                                left: 42.0,
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 20.0,
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                ),
                                              ),
                                              Positioned(
                                                top: 15.0,
                                                left: 52.0,
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 22.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),

                        // image
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(travelList[index].image),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),

          // dot indicator
          Positioned(
            top: 120.0,
            right: 32.0,
            child: DotsIndicator(
              dotsCount: travelList.length,
              position: _currentIndex.toDouble(), // current index
              axis: Axis.vertical,
              decorator: DotsDecorator(
                color: Colors.black12,
                activeColor: _color,
                size: Size(8.0, 8.0),
                activeSize: Size(8.0, 40.0),
                activeShape: StadiumBorder(),
                spacing: EdgeInsets.all(2.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
