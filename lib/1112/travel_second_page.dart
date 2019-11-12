import 'package:flutter/material.dart';

class TravelSecondPage extends StatefulWidget {
  @override
  _TravelSecondPageState createState() => _TravelSecondPageState();
}

class _TravelSecondPageState extends State<TravelSecondPage> {
  List<Widget> pages;

  int _currentIndex = 0;  // bottombar index

  String title = "Discover";

  String _profileImage = "https://cdn.pixabay.com/photo/2019/10/17/14/52/white-4557097__340.jpg";

  @override
  Widget build(BuildContext context) {
    _definePages();

    return Scaffold(
      body: SafeArea(
          top: true,
          left: true,
          right: true,
          child: pages[_currentIndex],
      ),

      // bottombar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        unselectedIconTheme: IconThemeData(size: 32.0, color: Colors.black12),
        selectedIconTheme: IconThemeData(size: 32.0, color: Colors.black),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: (int currentIndex){
          setState(() {
            _currentIndex = currentIndex;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.multiline_chart), title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text("")),
        ],
      ),
    );
  }

  _definePages(){
    pages = [
      // first page
      Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // appbar
            Container(
              margin: EdgeInsets.only(right: 24.0),
              height: 64.0,
              child: Row(
                children: <Widget>[
                  Icon(Icons.sort, size: 24.0, color: Colors.black),
                  Spacer(),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(image: NetworkImage(_profileImage), fit: BoxFit.fill)
                    ),
                  ),
                ],
              ),
            ),

            // title
            Text(title,
            style: TextStyle(color: Colors.black, fontSize: 32.0, fontWeight: FontWeight.bold),
            ),

            // tabbar
            Container(
              height: 64.0,
              child: Placeholder(),
            ),

            // tabbar view
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                child: Placeholder(),
              ),
            ),
          ],
        ),
      ),

      //
      Placeholder(color: Colors.amber),
      Placeholder(color: Colors.green),
      Placeholder(color: Colors.indigo),
    ];
  }
}
