import 'dart:ui';
import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// https://dribbble.com/shots/6151406-Instagram-Dark-or-Light

class InstagramApp extends StatefulWidget {
  @override
  _InstagramAppState createState() => _InstagramAppState();
}

class _InstagramAppState extends State<InstagramApp> {
  // bottomNavigation Index
  int _currentIndex = 0;

  List<Widget> pages;

  String title = "Instagram";

  // about post
  String _postImage = "https://cdn.pixabay.com/photo/2019/10/25/06/07/sky-4576072_960_720.jpg";
  String username = "denil.d";

  // color
  Color _backgroundColor = Colors.white;
  Color _iconColor = Colors.black;

  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    _definePages();
    return Scaffold(
      body: pages[_currentIndex],

      // bottomNavigator
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0)
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.grey[300],

          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          onTap: (int selectedIndex){
            setState(() {
              _currentIndex = selectedIndex;
            });
          },

          selectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(size: 32.0),
          unselectedItemColor: Colors.grey,
          unselectedIconTheme: IconThemeData(size: 32.0),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text(""), backgroundColor: Colors.grey[300]),
            BottomNavigationBarItem(icon: Icon(Icons.search), title: Text(""), backgroundColor: Colors.grey[300]),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.instagram), title: Text(""), backgroundColor: Colors.grey[300]),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), title: Text(""), backgroundColor: Colors.grey[300]),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text(""), backgroundColor: Colors.grey[300]),
          ],
        ),
      ),
    );
  }

  _definePages(){
    pages = [
      // first page
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        color: _backgroundColor,
        child: CustomScrollView(
          slivers: <Widget>[
            // appbar
            SliverAppBar(
              backgroundColor: _backgroundColor,
              //
              leading: Icon(FontAwesomeIcons.camera, size: 24.0, color: _iconColor,),
              //
              centerTitle: true,
              title: Text(title,
                style: TextStyle(fontSize: 32.0, color: _iconColor, fontWeight: FontWeight.bold, fontFamily: "BeautyMountainsPersonalUse"),),
              //
              actions: <Widget>[
                IconButton(
                  onPressed: (){
                    setState(() {
                      // on clicked event => change color, dark mode, normal mode
                      print("change mode = $darkMode");
                      darkMode = !darkMode;
                      _backgroundColor = darkMode? Colors.black : Colors.white;
                      _iconColor = darkMode? Colors.white : Colors.black;
                    });
                  },
                  icon: Icon(FontAwesomeIcons.paperPlane, size: 24.0, color: _iconColor,),
                ),
              ],
            ),

            // story
            SliverToBoxAdapter(
              child: Container(
                color: _backgroundColor,
                margin: EdgeInsets.only(top: 16.0),
                height: 100.0,
                child: Column(
                  children: <Widget>[
                    //
                    Row(
                      children: <Widget>[
                        Text("Stories", style: TextStyle(fontSize: 16.0, color: _iconColor, fontWeight: FontWeight.w600),),
                        Spacer(),
                        Icon(Icons.arrow_right, size: 24.0, color: _iconColor,),
                        Text("Watch all", style: TextStyle(fontSize: 16.0, color: _iconColor, fontWeight: FontWeight.w600),),
                      ],
                    ),

                    Container(
                      color: _backgroundColor,
                      height: 76.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: itemList.length,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(right: 16.0),
                            height: 76.0,
                            width: 64.0,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 56.0,
                                  width: 56.0,
                                  child: Stack(
                                    children: <Widget>[
                                      itemList[index].isSelected?
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(colors: [Colors.pink, Colors.deepOrange],
                                          begin: Alignment.topCenter, end: Alignment.bottomCenter)
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.all(2.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.white, width: 1.0),
                                            image: DecorationImage(image: NetworkImage(itemList[index].image), fit: BoxFit.fill),
                                          ),
                                        ),
                                      ) : Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.white, width: 1.0),
                                          image: DecorationImage(image: NetworkImage(itemList[index].image), fit: BoxFit.fill),
                                        ),
                                      ),

                                      index ==0? Positioned(
                                        right: 0,
                                        bottom: 0,
                                        child: Container(
                                          height: 16.0,
                                          width: 16.0,
                                          decoration: BoxDecoration(shape: BoxShape.circle, color: _iconColor,
                                          border: Border.all(color: Colors.white, width: 1.0)),
                                          child: Center(child: Icon(Icons.add, size: 12.0, color: _backgroundColor,)),
                                        ),
                                      ): Container(),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 4.0,),
                                Text(itemList[index].name,
                                  style: TextStyle(fontSize: 10.0, color: index ==0? Colors.grey: _iconColor, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // divider
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                height: 2.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: darkMode? [Colors.black, Colors.black]: [Colors.white, Colors.grey[300], Colors.white],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )
                ),
              ),
            ),

            // main
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int idx){
                  return Container(
                    margin: EdgeInsets.only(bottom: 24.0),
                    height: 500.0,
                    child: Column(
                      children: <Widget>[
                        // image
                        Container(
                          margin: EdgeInsets.only(bottom: 8.0),
                          height: 392.0,
                          child: Stack(
                            children: <Widget>[
                              // shadow image
                              Positioned(
                                top: 0,
                                left: 24.0,
                                right: 24.0,
                                bottom: 0,
                                child: ClipRect(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      image: DecorationImage(image: NetworkImage(_postImage), fit: BoxFit.fill),
                                    ),
                                    child: BackdropFilter(
                                      filter: prefix0.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                    child: Container(
                                      color: darkMode? Colors.black: Colors.white.withOpacity(0.8),
                                    ),
                                    ),
                                  ),
                                ),
                              ),

                              // real image
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                bottom: 16.0,
                                child: Container(
                                  padding: EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    image: DecorationImage(image: NetworkImage(_postImage), fit: BoxFit.fill)
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(right: 8.0),
                                            height: 40.0,
                                            width: 40.0,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: LinearGradient(colors: [Colors.pink, Colors.deepOrange],
                                                    begin: Alignment.topCenter, end: Alignment.bottomCenter)
                                            ),
                                            child: Container(
                                              margin: EdgeInsets.all(2.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(color: Colors.white, width: 1.0),
                                                image: DecorationImage(image: NetworkImage(itemList[0].image), fit: BoxFit.fill),
                                              ),
                                            ),
                                          ),

                                          Text(username,
                                            style: TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.w600),
                                          ),

                                          Spacer(),

                                          Icon(Icons.more_horiz, size: 24.0, color: Colors.white,),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // text
                        Container(
                          color: _backgroundColor,
                          height: 100.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // icon
                              Container(
                                alignment: Alignment.topLeft,
                                height: 32.0,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.favorite_border, size: 24.0, color: _iconColor,),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Icon(Icons.chat_bubble_outline, size: 24.0, color: _iconColor,),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Icon(FontAwesomeIcons.paperPlane, size: 24.0, color: _iconColor,),
                                    Spacer(),
                                    Icon(Icons.bookmark_border, size: 24.0, color: _iconColor,),
                                  ],
                                ),
                              ),

                              Text("2,234 Likes",
                              style: TextStyle(fontSize: 16.0, color: _iconColor, fontWeight: FontWeight.w600),
                              ),

                             RichText(
                               text: TextSpan(children: [
                                 TextSpan(text: username,
                                   style: TextStyle(fontSize: 14.0, color: _iconColor, fontWeight: FontWeight.w600),
                                 ),

                                 TextSpan(text: "    Hi !!  ",
                                   style: TextStyle(fontSize: 16.0, color: _iconColor, fontWeight: FontWeight.w400),
                                 ),

                                 TextSpan(text: "#neonphotoset",
                                   style: TextStyle(fontSize: 16.0, color: Colors.lightBlueAccent, fontWeight: FontWeight.w600),
                                 ),
                               ]),
                             ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              childCount: 3
            ),
          ),
          ],
        ),
      ),

      // etc
      Placeholder(),
      Placeholder(color: Colors.red,),
      Placeholder(),
      Placeholder(color: Colors.red,),
    ];
}
}

class ItemList {
  String image;
  String name;
  bool isSelected;

  ItemList({this.image, this.name, this.isSelected});
}

List<ItemList> itemList = [
  ItemList(image: "https://cdn.pixabay.com/photo/2019/11/03/01/56/landscape-4597742__340.jpg", name: "Your story", isSelected: true),
  ItemList(image: "https://cdn.pixabay.com/photo/2019/08/28/14/24/horn-4436913__340.jpg", name: "Velo.sid", isSelected: false),
  ItemList(image: "https://cdn.pixabay.com/photo/2019/11/03/08/35/road-4598095__340.jpg", name: "chris.a", isSelected: false),
  ItemList(image: "https://cdn.pixabay.com/photo/2019/11/04/01/11/cellular-4599956__340.jpg", name: "de.skcnslk", isSelected: true),
  ItemList(image: "https://cdn.pixabay.com/photo/2019/11/05/20/36/abu-dhabi-4604499__340.jpg", name: "dc.dzcds", isSelected: true),
];




















