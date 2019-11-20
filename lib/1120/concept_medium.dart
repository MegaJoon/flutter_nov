import 'package:flutter/material.dart';
import 'package:flutter_nov/1120/my_bottom_tab.dart';

// https://dribbble.com/shots/8338226-Concept-Medium/attachments/671420?mode=media

class ConceptMedium extends StatefulWidget {
  @override
  _ConceptMediumState createState() => _ConceptMediumState();
}

class _ConceptMediumState extends State<ConceptMedium> {
  // pages
  List<Widget> pages = List<Widget>();
  List<Widget> pageInPages = List<Widget>();

  // color
  Color _backgroundColor = Color.fromRGBO(135, 219, 186, 1);
  Color _indicatorColor = Color.fromRGBO(236, 103, 88, 1);

  String _profileImage =
      "https://cdn.pixabay.com/photo/2019/11/18/19/39/christmas-4635626__340.jpg";

  // bottombar index
  int _currentIndex = 0;

  //
  void _onPressed(int currentIndex) {
    setState(() {
      _currentIndex = currentIndex;
      print("_currentIndex = $_currentIndex");
    });
  }

  // tab index
  int _selectedIndex = 0;

  // padding
  double padding = 24.0;

  // globalkey
  GlobalKey _containerKey = GlobalKey();
  GlobalKey _containerKey1 = GlobalKey();
  GlobalKey _containerKey2 = GlobalKey();
  GlobalKey _containerKey3 = GlobalKey();
  GlobalKey _containerKey4 = GlobalKey();
  GlobalKey _containerKey5 = GlobalKey();
  GlobalKey _containerKey6 = GlobalKey();

  // position x,y
  double _positionX = 24.0;
  double _positionY = 116.0;

  // tab index
  void _onTabClicked(int selectedIndex) {
    setState(() {
      GlobalKey globalKey;
      if (selectedIndex == 0) {
        globalKey = _containerKey;
      } else if (selectedIndex == 1) {
        globalKey = _containerKey1;
      } else if (selectedIndex == 2) {
        globalKey = _containerKey2;
      } else if (selectedIndex == 3) {
        globalKey = _containerKey3;
      } else if (selectedIndex == 4) {
        globalKey = _containerKey4;
      } else if (selectedIndex == 5) {
        globalKey = _containerKey5;
      } else if (selectedIndex == 6) {
        globalKey = _containerKey6;
      }

      final RenderBox containerRenderBox =
          globalKey.currentContext.findRenderObject();
      final containerPosition = containerRenderBox.localToGlobal(Offset.zero);

      _positionX = containerPosition.dx;
      _positionY = containerPosition.dy;
      print("_positionX = $_positionX");
      print("_positionY = $_positionY");

      _selectedIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    _definePages();

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Column(
        children: <Widget>[
          // appbar
          SafeArea(
            top: true,
            left: true,
            right: true,
            child: Container(
              padding: EdgeInsets.only(left: padding),
              height: 64.0,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 2.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // title
                  Text(
                    "Medium",
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 6.0,
                      fontFamily: "San Marino Beach",
                    ),
                  ),

                  // icon
                  Container(
                    width: 64.0,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                    child: Center(
                      child: Icon(Icons.menu, size: 32.0, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // body
          pages[_currentIndex],
        ],
      ),

      // bottom bar
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 56.0,
          color: _backgroundColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyBottomTab(
                icon: Icons.crop_square,
                text: "Feed",
                isSelected: _currentIndex == 0,
                onPressed: () {
                  setState(() {
                    _onPressed(0);
                  });
                },
              ),
              MyBottomTab(
                icon: Icons.bookmark_border,
                text: "Mark",
                isSelected: _currentIndex == 1,
                onPressed: () {
                  setState(() {
                    _onPressed(1);
                  });
                },
              ),
              MyBottomTab(
                icon: Icons.note_add,
                text: "note",
                isSelected: _currentIndex == 2,
                onPressed: () {
                  setState(() {
                    _onPressed(2);
                  });
                },
              ),
              MyBottomTab(
                icon: Icons.person_outline,
                text: "user",
                isSelected: _currentIndex == 3,
                onPressed: () {
                  setState(() {
                    _onPressed(3);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _definePages() {
    // tabbar view pages
    pageInPages = [
      // initial page
      Container(
        margin: EdgeInsets.only(left: padding),
        height: 370.0,
        child: ListView.builder(
//            padding: EdgeInsets.only(top: padding),
        padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: mediumItemList.length,
            itemBuilder: (BuildContext context, int idx) {
              return Container(
                margin: EdgeInsets.only(right: padding),
                height: 450.0,
                width: 280.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(mediumItemList[idx].image),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    // red container filter
                    idx == 0
                        ? Positioned(
                            top: 0,
                            left: 0,
                            bottom: 0,
                            child: Container(
                              width: 100.0,
                              color: Colors.redAccent.withOpacity(0.5),
                            ),
                          )
                        : Container(),

                    // profile icon
                    idx == 0
                        ? Positioned(
                            top: padding * 0.8,
                            right: padding * 0.8,
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              child: Image.network(_profileImage,
                                  fit: BoxFit.fill),
                            ),
                          )
                        : Container(),

                    // text
                    Positioned(
                      left: padding,
                      bottom: padding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            mediumItemList[idx].date,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                height: 1.5),
                          ),
                          Text(
                            mediumItemList[idx].title,
                            style: TextStyle(
                                fontSize: 28.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),

      // dont use
      Placeholder(color: Colors.teal),
      Placeholder(color: Colors.deepPurple),
      Placeholder(color: Colors.teal),
      Placeholder(color: Colors.deepPurple),
      Placeholder(color: Colors.teal),
      Placeholder(color: Colors.deepPurple),
    ];

    // bottom pages
    pages = [
      // initial page
      Column(
        children: <Widget>[
          // tabbar
          Container(
            padding: EdgeInsets.symmetric(horizontal: padding),
            margin: EdgeInsets.symmetric(vertical: padding * 0.50),
            height: 100.0,
            child: Stack(
              children: <Widget>[
                // indicator
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  top: _positionY - 106.0,
                  left: _positionX - 24.0,
                  child: Container(
                    height: 32.0,
                    width: 40.0,
                    color: _indicatorColor,
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            _onTabClicked(0);
                          },
                          key: _containerKey,
                          child: Text(
                            "Future".toUpperCase(),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _onTabClicked(1);
                          },
                          key: _containerKey1,
                          child: Text(
                            "Tehnlogy".toUpperCase(),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _onTabClicked(2);
                          },
                          key: _containerKey2,
                          child: Text(
                            "Elemental".toUpperCase(),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _onTabClicked(3);
                          },
                          key: _containerKey3,
                          child: Text(
                            "health".toUpperCase(),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: padding),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              _onTabClicked(4);
                            },
                            key: _containerKey4,
                            child: Text(
                              "science".toUpperCase(),
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _onTabClicked(5);
                            },
                            key: _containerKey5,
                            child: Text(
                              "design".toUpperCase(),
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _onTabClicked(6);
                            },
                            key: _containerKey6,
                            child: Text(
                              "self".toUpperCase(),
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: 32.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black, width: 2.0)),
                            child: Center(
                              child: Text(
                                "More".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // tabbarview
          pageInPages[_selectedIndex],
        ],
      ),

      // dont use
      Placeholder(color: Colors.amber),
      Placeholder(color: Colors.green),
      Placeholder(color: Colors.indigo),
    ];
  }
}

class MediumItemList {
  String image;
  String date;
  String title;

  MediumItemList({this.image, this.date, this.title});
}

List<MediumItemList> mediumItemList = [
  MediumItemList(
      image:
          "https://cdn.pixabay.com/photo/2019/10/14/20/09/nature-4549913_960_720.jpg",
      date: "11.19.2045-8m read",
      title: "The World is\nour Interface"),
  MediumItemList(
      image:
          "https://cdn.pixabay.com/photo/2019/11/02/01/15/dj-4595492_960_720.jpg",
      date: "11.19.2045-8m read",
      title: "The World is\nour Interface"),
  MediumItemList(
      image:
          "https://cdn.pixabay.com/photo/2019/11/02/20/18/fog-4597348_960_720.jpg",
      date: "11.19.2045-8m read",
      title: "The World is\nour Interface"),
];
