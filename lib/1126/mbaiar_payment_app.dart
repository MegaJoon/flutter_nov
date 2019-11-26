import 'package:flutter/material.dart';
import 'package:flutter_nov/1126/custom_bottom_item.dart';

// https://dribbble.com/shots/8520413-mbaiar-Payment-App/attachments/803646?mode=media

class MbaiarPaymentApp extends StatefulWidget {
  @override
  _MbaiarPaymentAppState createState() => _MbaiarPaymentAppState();
}

class _MbaiarPaymentAppState extends State<MbaiarPaymentApp> {

  int _currentIndex = 0;  // bottom index

  void _onPressed(int num){
    setState(() {
      _currentIndex = num;
    });
  }

  double padding = 16.0;

  String title = "mbaiar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                // appbar
                Container(
                  height: 150.0,
                  child: Stack(
                    children: <Widget>[
                      // indigo color container
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 20.0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: padding),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.0),
                            ),
                            color: Colors.indigo,
                          ),
                          child: SafeArea(
                            top: true,
                            left: true,
                            right: true,
                            child: Column(
                              children: <Widget>[
                                // appbar
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Icon(Icons.menu, size: 20.0, color: Colors.white),
                                    Text(title,
                                      style: TextStyle(
                                        fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(Icons.search, size: 20.0, color: Colors.white),
                                  ],
                                ),

                                // bottom : profile image
                                Container(
                                  margin: EdgeInsets.only(top: padding *0.5),
                                  height: 40.0,
                                  child: Row(
                                    children: <Widget>[
                                      // user profile image
                                      Container(
                                        margin: EdgeInsets.only(right: padding *0.5),
                                        height: 40.0,
                                        width: 40.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                      ),

                                      // text
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("Hello,",
                                          style: TextStyle(
                                            fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w300,
                                          ),
                                          ),

                                          Text("Sandy Nugraha",
                                            style: TextStyle(
                                              fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // your balance container
                      Positioned(
                        left: padding,
                        right: padding,
                        bottom: 0,
                        child: Container(
                          height: 40.0,
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: padding *1.5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: Colors.white,
                                    boxShadow: [BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    )],
                                  ),

                                  child: Center(
                                    child: Row(
                                      children: <Widget>[
                                        Text("Your balance : ",
                                        style: TextStyle(
                                          fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w400,
                                        ),
                                        ),

                                        Spacer(),

                                        Text("Rp. 2,100,500",
                                          style: TextStyle(
                                            fontSize: 20.0, color: Colors.green, fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: padding),

                              Flexible(
                                child: Container(
//                                  padding: EdgeInsets.symmetric(horizontal: padding *1.5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: Colors.green,
                                    boxShadow: [BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    )],
                                  ),

                                  child: Center(
                                    child: Text("Top Up",
                                      style: TextStyle(
                                        fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // main box
                Container(
                  padding: EdgeInsets.only(top: padding, left: padding),
                  height: 600.0,
                  child: Column(
                    children: <Widget>[
                      // tabbar
                      Container(
                        height: 40.0,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: padding),
                              height: 40.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.0),
                                boxShadow: [BoxShadow(
                                  color: Colors.indigo.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                )],
                              ),
                              child: Center(
                                child: Text("Monthly",
                                style: TextStyle(
                                  fontSize: 14.0, color: Colors.indigo, fontWeight: FontWeight.w600,
                                ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: padding),
                              height: 40.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Center(
                                child: Text("Annual",
                                style: TextStyle(
                                  fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w600,
                                ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: padding),
                              height: 40.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Center(
                                child: Text("Streaming TV",
                                style: TextStyle(
                                  fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w600,
                                ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: padding),
                              height: 40.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Center(
                                child: Text("Design Tool",
                                style: TextStyle(
                                  fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w600,
                                ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: padding),
                              height: 40.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Center(
                                child: Text("Design Tool",
                                style: TextStyle(
                                  fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w600,
                                ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // tabbarview
                      Container(
                        padding: EdgeInsets.only(top: padding, right: padding),
                        height: 600.0,
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: padding *0.5),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: toolList.length,
                            itemBuilder: (context, index){
                              return InkWell(
                                onTap: (){
                                  setState(() {
                                    toolList[index].isSelected = !toolList[index].isSelected;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: padding *0.5),
                                  height: 72.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: toolList[index].isSelected? Colors.grey[300] : Colors.white,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      // tool icon
                                      Container(
                                        padding: EdgeInsets.all(12.0),
                                        margin: EdgeInsets.only(right: padding),
//                                      height: 72.0,
                                        width: 72.0,
                                        child: Image.asset(toolList[index].image, fit: BoxFit.cover, color:  toolList[index].isSelected? Colors.grey : null,),
                                      ),

                                      // text
                                      Flexible(
                                        fit: FlexFit.tight,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(toolList[index].tool,
                                              style: TextStyle(
                                                fontSize: 16.0, color:  toolList[index].isSelected? Colors.grey : Colors.black, fontWeight: FontWeight.bold,
                                              ),
                                              ),

                                              SizedBox(height: 8.0),
                                              Text(toolList[index].time,
                                                style: TextStyle(
                                                  fontSize: 12.0, color: index ==1? Colors.red : Colors.grey, fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                      ),

                                      // top arrow
                                      toolList[index].isSelected? Container(
                                        margin: EdgeInsets.only(right: padding),
                                        height: 32.0,
                                        width: 32.0,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(4.0),
                                          boxShadow: [BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 1,
                                            spreadRadius: 1,
                                          )],
                                        ),
                                        child: Center(child: Icon(Icons.arrow_upward, size: 24.0, color: Colors.white)),
                                      ) : Container(),
                                    ],
                                  ),
                                ),
                              );
                            },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 64.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.black12, blurRadius: 1, spreadRadius: 1,
                )],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomBottomItem(
                    icon: Icons.home,
                    text: "Home",
                    isSelected: _currentIndex == 0,
                    onPressed: (){
                      _onPressed(0);
                    },
                  ),

                  CustomBottomItem(
                    icon: Icons.child_care,
                    text: "Browse",
                    isSelected: _currentIndex == 1,
                    onPressed: (){
                      _onPressed(1);
                    },
                  ),

                  CustomBottomItem(
                    icon: Icons.mail_outline,
                    text: "InBox",
                    isSelected: _currentIndex == 2,
                    onPressed: (){
                      _onPressed(2);
                    },
                  ),

                  CustomBottomItem(
                    icon: Icons.person_outline,
                    text: "Profile",
                    isSelected: _currentIndex == 3,
                    onPressed: (){
                      _onPressed(3);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ToolList {
  String image;
  String tool;
  String time;
  bool isSelected;

  ToolList({this.image, this.tool, this.time, this.isSelected});
}

List<ToolList> toolList = [
  ToolList(image: "assets/tool/youtube.png", tool: "Youtube Premium", time: "Expired 2 days ago", isSelected: true),
  ToolList(image: "assets/tool/netflix.png", tool: "Netflix", time: "Expires on 10/22/19 - 3 days left", isSelected: false),
  ToolList(image: "assets/tool/spotify.png", tool: "Spotify", time: "Expires on 10/27/19 - 8 days left", isSelected: false),
  ToolList(image: "assets/tool/adobe.png", tool: "Adobe Cloud Creative", time: "Expires on 10/27/19 - 8 days left", isSelected: false),
  ToolList(image: "assets/tool/photoshop.png", tool: "Photoshop CC 2020", time: "Expires on 10/27/19 - 8 days left", isSelected: false),
  ToolList(image: "assets/tool/dropbox.png", tool: "Dropbox", time: "Expires on 10/27/19 - 8 days left", isSelected: false),

  //
  ToolList(image: "assets/tool/youtube.png", tool: "Youtube Premium", time: "Expired 2 days ago", isSelected: false),
  ToolList(image: "assets/tool/netflix.png", tool: "Netflix", time: "Expires on 10/22/19 - 3 days left", isSelected: false),
  ToolList(image: "assets/tool/spotify.png", tool: "Spotify", time: "Expires on 10/27/19 - 8 days left", isSelected: false),
  ToolList(image: "assets/tool/adobe.png", tool: "Adobe Cloud Creative", time: "Expires on 10/27/19 - 8 days left", isSelected: false),
  ToolList(image: "assets/tool/photoshop.png", tool: "Photoshop CC 2020", time: "Expires on 10/27/19 - 8 days left", isSelected: false),
  ToolList(image: "assets/tool/dropbox.png", tool: "Dropbox", time: "Expires on 10/27/19 - 8 days left", isSelected: false),
];















