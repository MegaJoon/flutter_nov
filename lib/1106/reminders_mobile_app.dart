import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nov/1106/myContainer.dart';
import 'package:flutter_nov/1106/second_page.dart';

// https://dribbble.com/shots/7991398-Reminders-Mobile-App/attachments/525586?mode=media

class RemindersMobileApp extends StatefulWidget {
  @override
  _RemindersMobileAppState createState() => _RemindersMobileAppState();
}

class _RemindersMobileAppState extends State<RemindersMobileApp> {
  // background color
  Color _color = Color.fromRGBO(118, 199, 230, 1);

  // floating button color
  Color _btnColor = Color.fromRGBO(246, 118, 88, 1);

  // accent color
  Color _accentColor = Color.fromRGBO(84, 164, 205, 1);

  // title
  String title = "Daily\nReminders";

  // subTitle
  String subTitle = "Today";

  // profile Image
  String _image =
      "https://cdn.pixabay.com/photo/2015/09/02/12/58/woman-918788__340.jpg";
  String _image2 =
      "https://cdn.pixabay.com/photo/2016/11/21/14/53/adult-1845814__340.jpg";
  String _image3 =
      "https://cdn.pixabay.com/photo/2015/10/12/15/16/cat-984367__340.jpg";
  String _image4 =
      "https://cdn.pixabay.com/photo/2016/11/22/21/42/adult-1850703__340.jpg";
  String _image5 =
      "https://cdn.pixabay.com/photo/2014/09/25/22/14/profile-461076__340.jpg";

  // tabbar index
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    _definePages();
    return Scaffold(
      backgroundColor: _color,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // appbar
          _buildAppBar(),

          // text title
          _buildTextTitle(),

          // white container
          _buildWhiteContainer(),
        ],
      ),
    );
  }

  _buildAppBar() {
    return SafeArea(
      top: true,
      left: true,
      right: true,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.0),
        height: 64.0,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.arrow_back,
              size: 32.0,
              color: Colors.black,
            ),
            Spacer(),
            Badge(
              child: Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 32.0,
              ),
              showBadge: true,
              position: BadgePosition.topLeft(top: 0.0, left: 2.0),
            ),
          ],
        ),
      ),
    );
  }

  _buildTextTitle() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0),
      height: 200.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            subTitle.toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                height: 2.0),
          ),
        ],
      ),
    );
  }

  _buildWhiteContainer() {
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        height: 500.0,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0.0,
              left: 0,
              right: 112.0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(16.0)),
                ),
              ),
            ),
            Positioned(
              top: 8.0,
              left: 0,
              right: 96.0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(16.0)),
                ),
              ),
            ),

            // main
            Positioned(
              top: 16.0,
              left: 0,
              right: 80.0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(right: 24.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(16.0)),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 24.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Text(
                          "shared reminders".toUpperCase(),
                          style: TextStyle(
                              color: _accentColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 16.0),
                        height: 150.0,
                        child: ListView(
                          padding: EdgeInsets.only(top: 16.0),
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            MyContainer(
                                image: _image,
                                name: "DC",
                                isSelected: _currentIndex == 0,
                                onTap: () {
                                  setState(() {
                                    _onTap(0);
                                  });
                                }),
                            MyContainer(
                                image: _image2,
                                name: "AC",
                                isSelected: _currentIndex == 1,
                                onTap: () {
                                  setState(() {
                                    _onTap(1);
                                  });
                                }),
                            MyContainer(
                                image: _image3,
                                name: "NC",
                                isSelected: _currentIndex == 2,
                                onTap: () {
                                  setState(() {
                                    _onTap(2);
                                  });
                                }),
                            MyContainer(
                                image: _image4,
                                name: "JC",
                                isSelected: _currentIndex == 3,
                                onTap: () {
                                  setState(() {
                                    _onTap(3);
                                  });
                                }),
                            MyContainer(
                                image: _image5,
                                name: "JV",
                                isSelected: _currentIndex == 4,
                                onTap: () {
                                  setState(() {
                                    _onTap(4);
                                  });
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Text(
                          "latest reminders".toUpperCase(),
                          style: TextStyle(
                              color: _accentColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      pages[_currentIndex],
                    ],
                  ),
                ),
              ),
            ),

            // floating button
            Positioned(
              right: 52.0,
              bottom: 40.0,
              child: FloatingActionButton(
                onPressed: () {
                  print("onPressed");
                },
                backgroundColor: _btnColor,
                child: Icon(
                  Icons.add,
                  size: 40.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _definePages() {
    pages = [
      //
      Container(
        margin: EdgeInsets.only(top: 16.0, left: 24.0),
        height: 500.0,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              height: 64.0,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 16.0),
                    height: 56.0,
                    width: 56.0,
                    decoration: BoxDecoration(
                      color: _color.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.pages,
                        size: 32.0,
                        color: _accentColor,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "New Job Activities",
                        style: TextStyle(
                            color: _accentColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "23 Jun 2019",
                        style: TextStyle(
                            color: _color,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              height: 64.0,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 16.0),
                    height: 56.0,
                    width: 56.0,
                    decoration: BoxDecoration(
                      color: _color.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.pages,
                        size: 32.0,
                        color: _accentColor,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "New Job Activities",
                        style: TextStyle(
                            color: _accentColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "23 Jun 2019",
                        style: TextStyle(
                            color: _color,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              height: 64.0,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 16.0),
                    height: 56.0,
                    width: 56.0,
                    decoration: BoxDecoration(
                      color: _color.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.pages,
                        size: 32.0,
                        color: _accentColor,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "New Job Activities",
                        style: TextStyle(
                            color: _accentColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "23 Jun 2019",
                        style: TextStyle(
                            color: _color,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              height: 64.0,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 16.0),
                    height: 56.0,
                    width: 56.0,
                    decoration: BoxDecoration(
                      color: _color.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.pages,
                        size: 32.0,
                        color: _accentColor,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "New Job Activities",
                        style: TextStyle(
                            color: _accentColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "23 Jun 2019",
                        style: TextStyle(
                            color: _color,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //
      Container(
        height: 229.0,
        child: Placeholder(
          color: Colors.redAccent,
        ),
      ),
      Container(
        height: 229.0,
        child: Placeholder(),
      ),
      Container(
        height: 229.0,
        child: Placeholder(
          color: Colors.redAccent,
        ),
      ),
      Container(
        height: 229.0,
        child: Placeholder(),
      ),
      Container(
        height: 229.0,
        child: Placeholder(
          color: Colors.redAccent,
        ),
      ),
    ];
  }
}
