import 'package:flutter/material.dart';

class TravelSecondPage extends StatefulWidget {
  @override
  _TravelSecondPageState createState() => _TravelSecondPageState();
}

class _TravelSecondPageState extends State<TravelSecondPage> {
  List<Widget> pages;

  int _currentIndex = 0;  // bottombar index
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
      Placeholder(color: Colors.redAccent),
      Placeholder(color: Colors.amber),
      Placeholder(color: Colors.green),
      Placeholder(color: Colors.indigo),
    ];
  }
}
