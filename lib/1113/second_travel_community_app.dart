import 'package:flutter/material.dart';

import 'my_bottom_bar.dart';

// https://dribbble.com/shots/8171324-Travel-Community-App/attachments/569173?mode=media

class SecondTravelCommunityApp extends StatefulWidget {
  @override
  _SecondTravelCommunityAppState createState() => _SecondTravelCommunityAppState();
}

class _SecondTravelCommunityAppState extends State<SecondTravelCommunityApp> {
  List<Widget> pages;

  Color _backgroundColor = Colors.grey[200];
  Color _color = Color.fromRGBO(255, 101, 37, 1);

  String title = "Near Events";

  // profile image
  String _profileImage = "https://cdn.pixabay.com/photo/2019/11/06/12/04/window-4605938__340.jpg";
  String _profileImage1 = "https://cdn.pixabay.com/photo/2019/11/07/20/42/camping-4609863__340.jpg";
  String _profileImage2 = "https://cdn.pixabay.com/photo/2019/10/30/16/19/fox-4589927__340.jpg";
  String _profileImage3 = "https://cdn.pixabay.com/photo/2019/11/08/19/12/roses-4612187__340.jpg";

  // bottom index
  int _currentIndex = 1;   // init page = 1;

  void _onPressed(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _definePages();

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // appbar
            _buildAppbar(),

            // gridview
            _buildGridView(),

            // bottombar
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  _definePages(){
   pages = [
     Placeholder(),

     // init page
     Container(
       padding: EdgeInsets.all(24.0),
       child: GridView.builder(
           itemCount: 4,
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               mainAxisSpacing: 16.0,
               crossAxisSpacing: 16.0,
               childAspectRatio: 0.5 / 0.65
           ),
           itemBuilder: (BuildContext context, int idx){
             return idx == 3? Container(
               decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(24.0),
                   boxShadow: [BoxShadow(
                     color: Colors.black12,
                     spreadRadius: 1,
                     blurRadius: 1,
                   )]
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Container(
                     margin: EdgeInsets.only(bottom: 16.0),
                     height: 80.0,
                     width: 80.0,
                     decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         color: _color.withOpacity(0.8),
                         boxShadow: [BoxShadow(
                             color: Colors.black12,
                             spreadRadius: 1,
                             blurRadius: 1
                         )]
                     ),
                     child: Center(
                       child: Icon(Icons.add, size: 28.0, color: Colors.white),
                     ),
                   ),

                   Text("Add Event",
                     style: TextStyle(
                         fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600
                     ),
                   ),
                 ],
               ),
             )
                 : Container(
               child: Column(
                 children: <Widget>[
                   // image
                   Flexible(
                     flex: 3,
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.only(
                           topLeft:  Radius.circular(24.0),
                           topRight:  Radius.circular(24.0),
                         ),
                         image: DecorationImage(
                             image: NetworkImage(gridViewItem[idx].image),
                             fit: BoxFit.cover),
                       ),
                     ),
                   ),

                   // text
                   Flexible(
                     flex: 4,
                     child: Container(
                       padding: EdgeInsets.all(16.0),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.only(
                           bottomLeft: Radius.circular(24.0),
                           bottomRight: Radius.circular(24.0),
                         ),
                         boxShadow: [BoxShadow(
                           color: Colors.black12,
                           spreadRadius: 1,
                         blurRadius: 1,
                         )],
                         color: Colors.white,
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: <Widget>[
                           Text(gridViewItem[idx].title,
                           style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600),
                           ),

                           Text(gridViewItem[idx].day,
                             style: TextStyle(fontSize: 28.0, color: Colors.black, fontWeight: FontWeight.w600),
                           ),

                           Text(gridViewItem[idx].month,
                             style: TextStyle(fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w600),
                           ),

                           Center(
                             child: Container(
                               height: 32.0,
                               width: 105.0,
                               child: Stack(
                                 children: <Widget>[
                                   Positioned(
                                     top: 0,
                                     left: 0,
                                     bottom: 0,
                                     child: Container(
                                       width: 32.0,
                                       decoration: BoxDecoration(
                                         shape: BoxShape.circle,
                                         border: Border.all(color: Colors.white, width: 1.0),
                                         image: DecorationImage(
                                           image: NetworkImage(_profileImage1), fit: BoxFit.fill,
                                         ),
                                       ),
                                     ),
                                   ),

                                   Positioned(
                                     top: 0,
                                     left: 24,
                                     bottom: 0,
                                     child: Container(
                                       width: 32.0,
                                       decoration: BoxDecoration(
                                         shape: BoxShape.circle,
                                         border: Border.all(color: Colors.white, width: 1.0),
                                         image: DecorationImage(
                                           image: NetworkImage(_profileImage2), fit: BoxFit.fill,
                                         ),
                                       ),
                                     ),
                                   ),

                                   Positioned(
                                     top: 0,
                                     left: 48,
                                     bottom: 0,
                                     child: Container(
                                       width: 32.0,
                                       decoration: BoxDecoration(
                                         shape: BoxShape.circle,
                                         border: Border.all(color: Colors.white, width: 1.0),
                                         image: DecorationImage(
                                           image: NetworkImage(_profileImage3), fit: BoxFit.fill,
                                         ),
                                       ),
                                     ),
                                   ),

                                   Positioned(
                                     top: 0,
                                     left: 72.0,
                                     bottom: 0,
                                     child: Container(
                                       width: 32.0,
                                       decoration: BoxDecoration(
                                         shape: BoxShape.circle,
                                         border: Border.all(color: Colors.white, width: 1.0),
                                         color: Colors.black,
                                       ),
                                       child: Center(
                                           child: Icon(Icons.add, size: 20.0, color: Colors.white)),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),

                         ],
                       ),
                     ),
                   ),
                 ],
               ),
             );
           }),
     ),

     Placeholder(),
     Placeholder(),
   ];
  }

  _buildAppbar(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0),
      height: 64.0,
      color: _backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu, size: 28.0, color: Colors.black),
          Text(title,
          style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(_profileImage), fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }

  _buildGridView(){
    return Flexible(
      fit: FlexFit.tight,
      child: pages[_currentIndex],
    );
  }

  _buildBottomBar(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      height: 64.0,
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          MyBottomTab(icon: Icons.home, text: "Home", isSelected: _currentIndex == 0, onPressed: (){
            setState(() {
              _onPressed(0);
            });
          },
          ),

          MyBottomTab(icon: Icons.train, text: "Train", isSelected: _currentIndex == 1, onPressed: (){
            setState(() {
              _onPressed(1);
            });
          },
          ),

          MyBottomTab(icon: Icons.content_copy, text: "Copy", isSelected: _currentIndex == 2, onPressed: (){
            setState(() {
              _onPressed(2);
            });
          },
          ),

          MyBottomTab(icon: Icons.share, text: "Share", isSelected: _currentIndex == 3, onPressed: (){
            setState(() {
              _onPressed(3);
            });
          },
          ),
        ],
      ),
    );
  }
}

// gridviewitem
class GridViewItem {
  String image;
  String title;
  String day;
  String month;

  GridViewItem({this.image, this.title, this.day, this.month});
}

List<GridViewItem> gridViewItem = [
  GridViewItem(image: "https://cdn.pixabay.com/photo/2019/11/01/09/35/beach-4593705__340.jpg", title: "Bonfire Night", day: "16", month: "December 2019",),
  GridViewItem(image: "https://cdn.pixabay.com/photo/2019/11/10/16/47/nature-4616282__340.jpg", title: "Color Factory", day: "17", month: "December 2019",),
  GridViewItem(image: "https://cdn.pixabay.com/photo/2019/11/09/14/55/nature-4613735__340.jpg", title: "Game Event", day: "19", month: "December 2019",),
];








































