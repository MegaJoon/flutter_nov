import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_nov/1112/myTab.dart';
import 'package:flutter_nov/1112/place_item_list.dart';
import 'package:flutter_nov/1112/travel_third_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TravelSecondPage extends StatefulWidget {
  @override
  _TravelSecondPageState createState() => _TravelSecondPageState();
}

class _TravelSecondPageState extends State<TravelSecondPage> {
  List<Widget> pages;

  int _currentIndex = 0; // bottombar index

  int _selectedIndex = 0; // tabbar index

  String title = "Discover";

  String _profileImage =
      "https://cdn.pixabay.com/photo/2019/10/17/14/52/white-4557097__340.jpg";

  Color _color = Color.fromRGBO(92, 104, 190, 1);
  Color _color1 = Color.fromRGBO(239, 186, 81, 1);
  Color _color2 = Color.fromRGBO(165, 139, 188, 1);
//  Color _color3 = Color.fromRGBO(89, 177, 178, 1);

  void _onPressed(int idx) {
    setState(() {
      _selectedIndex = idx;
    });
  }

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
        onTap: (int currentIndex) {
          setState(() {
            _currentIndex = currentIndex;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(Icons.multiline_chart), title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), title: Text("")),
        ],
      ),
    );
  }

  _definePages() {
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
                  IconButton(icon: Icon(Icons.sort, size: 32.0, color: Colors.black),
                  onPressed: (){
                    setState(() {
                      Navigator.pop(context);
                    });
                  },),
                  Spacer(),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                            image: NetworkImage(_profileImage),
                            fit: BoxFit.fill)),
                  ),
                ],
              ),
            ),

            // title
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold),
            ),

            // tabbar
            Container(
              height: 64.0,
              child: Row(
                children: <Widget>[
                  MyTab(
                      text: "Places",
                      color: _color,
                      isSelected: _selectedIndex == 0,
                      onPressed: () {
                        _onPressed(0);
                      }),
                  MyTab(
                    text: "Inspiration",
                    color: _color1,
                      isSelected: _selectedIndex == 1,
                      onPressed: () {
                        _onPressed(1);
                      }),
                  MyTab(
                    text: "Emotions",
                    color: _color2,
                      isSelected: _selectedIndex == 2,
                      onPressed: () {
                        _onPressed(2);
                      }),
                ],
              ),
            ),

            // tabbar view
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                child: Column(
                  children: <Widget>[
                    // listview
                    Container(
                      height: 270.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                          itemCount: placeItemList.length,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.only(top: 16.0),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index){
                          // listview item
                            return InkWell(
                              onTap: (){
                                setState(() {
                                  // push
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdTravelPage(index)));
                                });
                              },
                              child: Hero(
                                tag: "travel $index",
                                child: Container(
                                  margin: EdgeInsets.only(right: 24.0, bottom: 24.0),
                                  padding: EdgeInsets.all(16.0),
                                  width: 220.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.0),
                                    image: DecorationImage(image: NetworkImage(placeItemList[index].image),
                                      fit: BoxFit.fill),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      // title
                                      Text(placeItemList[index].text,
                                      style: TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold),
                                      ),

                                      // location
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.location_on, size: 20.0, color: Colors.white),
                                          SizedBox(width: 4.0),
                                          Text(placeItemList[index].address,
                                            style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),

                    // Text: explore more
                    Container(
                      margin: EdgeInsets.only(right: 24.0),
                      height: 48.0,
                      child: Row(
                        children: <Widget>[
                          Text("Explore more",
                          style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
                          ),

                          Spacer(),

                          Text("See all",
                            style: TextStyle(fontSize: 16.0, color: Colors.indigo, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),

                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        child: ListView.builder(
                            padding: EdgeInsets.only(top: 16.0),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: exploreList.length,
                            itemBuilder: (BuildContext context, int idx){
                              return Padding(
                                padding: const EdgeInsets.only(right: 32.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 64.0,
                                      width: 64.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16.0),
                                        color: exploreList[idx].color.withOpacity(0.5),
                                      ),
                                      child: Center(
                                          child: Icon(exploreList[idx].icon, size: 32.0, color: exploreList[idx].color),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 8.0,
                                    ),

                                    Text(exploreList[idx].text,
                                    style: TextStyle(fontSize: 14.0, color: Colors.black26, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),

                  ],
                ),
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

class ExploreList {
  IconData icon;
  Color color;
  String text;

  ExploreList({this.icon, this.color, this.text});
}

List<ExploreList> exploreList = [
  ExploreList(icon: FontAwesomeIcons.wineBottle, color: Color.fromRGBO(92, 104, 190, 1), text: "Kayaking",),
  ExploreList(icon: FontAwesomeIcons.swimmer, color: Color.fromRGBO(239, 186, 81, 1), text: "Snorkeling",),
  ExploreList(icon: FontAwesomeIcons.wind, color: Color.fromRGBO(165, 139, 188, 1), text: "Balloning",),
  ExploreList(icon: FontAwesomeIcons.mountain, color: Color.fromRGBO(89, 177, 178, 1), text: "Hiking",),
];














