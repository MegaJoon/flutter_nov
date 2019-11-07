import 'dart:ui';
import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;
import 'package:flutter_nov/1107/itemlist.dart';
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

  PageController pageController;

  // pageview index
  int selectedPage = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }
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
        child: PageView(
//          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: pageController,
          children: <Widget>[
            // first page
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              color: Colors.white,
              child: CustomScrollView(
                slivers: <Widget>[
                  // appbar
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    //
                    leading: Icon(FontAwesomeIcons.camera, size: 24.0, color: Colors.black,),
                    //
                    centerTitle: true,
                    title: Text(title,
                      style: TextStyle(fontSize: 32.0, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "BeautyMountainsPersonalUse"),),
                    //
                    actions: <Widget>[
                      Icon(FontAwesomeIcons.paperPlane, size: 24.0, color: Colors.black,),
                    ],
                  ),

                  // story
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(top: 16.0),
                      height: 100.0,
                      child: Column(
                        children: <Widget>[
                          //
                          Row(
                            children: <Widget>[
                              Text("Stories", style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),),
                              Spacer(),
                              Icon(Icons.arrow_right, size: 24.0, color: Colors.black,),
                              Text("Watch all", style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),),
                            ],
                          ),

                          Container(
                            color: Colors.white,
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
                                                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black,
                                                    border: Border.all(color: Colors.white, width: 1.0)),
                                                child: Center(child: Icon(Icons.add, size: 12.0, color: Colors.white,)),
                                              ),
                                            ): Container(),
                                          ],
                                        ),
                                      ),

                                      SizedBox(height: 4.0,),

                                      // user name clicked
                                      Text(itemList[index].name,
                                        style: TextStyle(fontSize: 10.0, color: index ==0? Colors.grey: Colors.black, fontWeight: FontWeight.w600),
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
                            colors: [Colors.white, Colors.grey[300], Colors.white],
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
                                                color: Colors.white.withOpacity(0.8),
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
                                  color: Colors.white,
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
                                            Icon(Icons.favorite_border, size: 24.0, color: Colors.black,),
                                            SizedBox(
                                              width: 8.0,
                                            ),
                                            Icon(Icons.chat_bubble_outline, size: 24.0, color: Colors.black,),
                                            SizedBox(
                                              width: 8.0,
                                            ),
                                            Icon(FontAwesomeIcons.paperPlane, size: 24.0, color: Colors.black,),
                                            Spacer(),
                                            Icon(Icons.bookmark_border, size: 24.0, color: Colors.black,),
                                          ],
                                        ),
                                      ),

                                      Text("2,234 Likes",
                                        style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),
                                      ),

                                      RichText(
                                        text: TextSpan(children: [
                                          TextSpan(text: username,
                                            style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600),
                                          ),

                                          TextSpan(text: "    Hi !!  ",
                                            style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w400),
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

            // second page
            Container(
              child: CustomScrollView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                slivers: <Widget>[
                  // appbar
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    leading: Icon(Icons.arrow_back_ios, size: 24.0, color: Colors.black,),
                    title: Text("Velo.sid",
                      style: prefix1.TextStyle(fontSize: 32.0, color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    actions: <Widget>[
                      Icon(Icons.more_vert, size: 24.0, color: Colors.black,),
                    ],
                  ),

                  // divider
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 16.0),
                      height: 2.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.grey[300], Colors.white],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight
                        )
                      ),
                    ),
                  ),

                  // profile
                  SliverToBoxAdapter(
                    child: Container(
                      height: 300.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // posts & follower
                          Container(
                            height: 80.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                // profile image
                                Container(
                                  margin: EdgeInsets.only(right: 32.0),
                                  height: 72.0,
                                  width: 72.0,
                                  decoration: BoxDecoration(shape: BoxShape.circle,
                                  image: DecorationImage(image: NetworkImage(itemList[0].image), fit: BoxFit.fill)),
                                ),

                                Container(
                                  padding: EdgeInsets.only(right: 32.0, bottom: 4.0),
                                  width: MediaQuery.of(context).size.width - 104.0,
                                  child: Column(
                                    children: <Widget>[
                                      Flexible(
                                        flex: 2,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Flexible(
                                              child: Column(
                                                children: <Widget>[
                                                  Text("11.8K" ,
                                                  style: prefix1.TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),
                                                  ),

                                                  Text("posts" ,
                                                    style: prefix1.TextStyle(fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            Flexible(
                                              child: Column(
                                                children: <Widget>[
                                                  Text("198K" ,
                                                    style: prefix1.TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),
                                                  ),

                                                  Text("Follwers" ,
                                                    style: prefix1.TextStyle(fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            Flexible(
                                              child: Column(
                                                children: <Widget>[
                                                  Text("1309" ,
                                                    style: prefix1.TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),
                                                  ),

                                                  Text("Followers" ,
                                                    style: prefix1.TextStyle(fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Flexible(
                                        flex: 1,
                                        child: Row(
                                          children: <Widget>[
                                            // 3 btns
                                            // message btn
                                            Flexible(
                                              flex: 5,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(48.0),
                                                  bottomLeft: Radius.circular(48.0)),
                                                  border: Border.all(color: Colors.grey, width: 1.0),
                                                ),
                                                child: Center(
                                                    child: Text("Message",
                                                    style: prefix1.TextStyle(fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600),)),
                                              ),
                                            ),

                                            SizedBox(
                                              width: 4.0,
                                            ),

                                            // user btn
                                            Flexible(
                                              flex: 1,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.grey, width: 1.0),
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    children: <Widget>[
                                                      Icon(Icons.check, size: 16.0, color: Colors.grey,),
                                                      Icon(Icons.person_outline, size: 16.0, color: Colors.grey,),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),

                                            SizedBox(
                                              width: 4.0,
                                            ),

                                            // arrow btn
                                            Flexible(
                                              flex: 1,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(48.0),
                                                    bottomRight: Radius.circular(48.0)),
                                                border: Border.all(color: Colors.grey, width: 1.0),
                                              ),
                                              child: Center(
                                                  child: Icon(Icons.arrow_drop_down, size: 16.0, color: Colors.grey,),
                                            ),
                                            ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // text
                          Container(
                            padding: EdgeInsets.all(12.0),
                            height: 150.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("International Photograph 🌎",
                                style: prefix1.TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600),
                                ),

                                Text("Personal Blog",
                                  style: prefix1.TextStyle(fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600),
                                ),

                                Text("Valentina sidious".toUpperCase(),
                                  style: prefix1.TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w400),
                                ),

                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 220.0,
                                      child: Text("🧡 France, Paris / 💛 USA, California".toUpperCase(),
                                        style: prefix1.TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),

                                    Text("more",
                                      style: prefix1.TextStyle(fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),

                                Text("See translation".toUpperCase(),
                                  style: prefix1.TextStyle(fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w400),
                                ),

                                Text("instagram.com/p/BjaCQ3qh9WQ/",
                                  style: prefix1.TextStyle(fontSize: 14.0, color: Colors.lightBlueAccent, fontWeight: FontWeight.w400),
                                ),

                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(text: "Followed by ",
                                          style: prefix1.TextStyle(fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600),
                                      ),

                                      TextSpan(text: "jerreny.kimmell, jimmy.callens ",
                                        style: prefix1.TextStyle(fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600),
                                      ),

                                      TextSpan(text: "and ",
                                        style: prefix1.TextStyle(fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600),
                                      ),

                                      TextSpan(text: "robert_downney.jr",
                                        style: prefix1.TextStyle(fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600),
                                      ),
                                    ]
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // saved story
                          Container(
                            margin: EdgeInsets.only(left: 48.0),
                            height: 70.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 24.0),
                                  height: 70.0,
                                  width: 50.0,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 50.0,
                                        width: 50.0,
                                        decoration: BoxDecoration(shape: BoxShape.circle,
                                        image: DecorationImage(image: NetworkImage(itemList[1].image), fit: BoxFit.fill)),
                                      ),

                                      Text("#pro...",
                                        style: prefix1.TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(right: 24.0),
                                  height: 70.0,
                                  width: 50.0,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 50.0,
                                        width: 50.0,
                                        decoration: BoxDecoration(shape: BoxShape.circle,
                                            image: DecorationImage(image: NetworkImage(itemList[2].image), fit: BoxFit.fill)),
                                      ),

                                      Text("💘💡",
                                        style: prefix1.TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(right: 24.0),
                                  height: 70.0,
                                  width: 50.0,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 50.0,
                                        width: 50.0,
                                        decoration: BoxDecoration(shape: BoxShape.circle,
                                            image: DecorationImage(image: NetworkImage(itemList[3].image), fit: BoxFit.fill)),
                                      ),

                                      Text("⚽🏀",
                                        style: prefix1.TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // gridview
                ],
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



















