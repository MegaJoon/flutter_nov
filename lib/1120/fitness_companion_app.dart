import 'package:flutter/material.dart';
import 'package:flutter_nov/1120/my_custom_bottom_bar_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// https://dribbble.com/shots/8337381-Fitness-Companion-Mobile-App/attachments/671016?mode=media

class FitnessCompanionApp extends StatefulWidget {
  @override
  _FitnessCompanionAppState createState() => _FitnessCompanionAppState();
}

class _FitnessCompanionAppState extends State<FitnessCompanionApp> {
  // bottom current index
  int _currentIndex = 0;

  double padding = 24.0;

  // onclicked -> set bottom index
  void _onPressed(int currentIndex){
    setState(() {
      _currentIndex = currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // entire scroll
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(top: padding, left: padding, right: padding),
          // containe statusbar
          child: SafeArea(
              top: true,
              left: true,
              right: true,
              // main
              child: Column(
                children: <Widget>[
                  // top container : good job!
                  Container(
                    // spacer between containers
                    margin: EdgeInsets.only(bottom: padding * 1.5),
                    padding: EdgeInsets.all(padding),
                    height: 350.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: <Widget>[
                        // left : text, chart
                        Flexible(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // title
                              Text("Good job!",
                                style: TextStyle(fontSize: 32.0, color: Colors.indigo, fontWeight: FontWeight.bold),
                              ),

                              Spacer(),

                              // subtitle
                              Text("You have logged\nyour stats everyday\nin last 7 days!",
                                style: TextStyle(
                                  fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w600,
                                ),
                              ),

                              Spacer(),

                              // chart here
                              Container(
                                height: 130.0,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    // m
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          // 1 bar

                                          // end bar
                                          Container(
                                            margin: EdgeInsets.only(bottom: 2.0),
                                            height: 14.0,
                                            width: 6.0,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(16.0),
                                                  topRight: Radius.circular(16.0),
                                                ),
                                                color: Colors.deepOrange
                                            ),
                                          ),

                                          // middle bar
                                          Container(
                                            margin: EdgeInsets.only(bottom: 2.0),
                                            height: 14.0,
                                            width: 6.0,
                                            color: Colors.deepOrange,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 2.0),
                                            height: 14.0,
                                            width: 6.0,
                                            color: Colors.deepOrange,
                                          ),

                                          // start bar
                                          Container(
                                            height: 14.0,
                                            width: 6.0,
                                            decoration: BoxDecoration(
                                             borderRadius: BorderRadius.only(
                                                 bottomLeft: Radius.circular(16.0),
                                             bottomRight: Radius.circular(16.0),
                                             ),
                                              color: Colors.deepOrange
                                            ),
                                          ),


                                          SizedBox(height: 8.0),
                                          Text("M",
                                          style: TextStyle(
                                            fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600,
                                          ),
                                          ),

                                          SizedBox(height: 4.0),
                                        ],
                                      ),
                                    ),

                                    // t
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          // 1 bar

                                          // end bar
                                          Container(
                                            margin: EdgeInsets.only(bottom: 2.0),
                                            height: 14.0,
                                            width: 6.0,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(16.0),
                                                  topRight: Radius.circular(16.0),
                                                ),
                                                color: Colors.deepOrange
                                            ),
                                          ),

                                          // middle bar
                                          Container(
                                            margin: EdgeInsets.only(bottom: 2.0),
                                            height: 14.0,
                                            width: 6.0,
                                            color: Colors.deepOrange,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 2.0),
                                            height: 14.0,
                                            width: 6.0,
                                            color: Colors.deepOrange,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 2.0),
                                            height: 14.0,
                                            width: 6.0,
                                            color: Colors.deepOrange,
                                          ),

                                          // start bar
                                          Container(
                                            height: 14.0,
                                            width: 6.0,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(16.0),
                                                  bottomRight: Radius.circular(16.0),
                                                ),
                                                color: Colors.deepOrange
                                            ),
                                          ),


                                          SizedBox(height: 8.0),
                                          Text("T",
                                            style: TextStyle(
                                              fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600,
                                            ),
                                          ),

                                          SizedBox(height: 4.0),
                                        ],
                                      ),
                                    ),

                                    // w
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          // 1 bar

                                          // end bar
                                          Container(
                                            margin: EdgeInsets.only(bottom: 2.0),
                                            height: 14.0,
                                            width: 6.0,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(16.0),
                                                  topRight: Radius.circular(16.0),
                                                ),
                                                color: Colors.deepOrange
                                            ),
                                          ),

                                          // middle bar
                                          Container(
                                            margin: EdgeInsets.only(bottom: 2.0),
                                            height: 14.0,
                                            width: 6.0,
                                            color: Colors.deepOrange,
                                          ),

                                          // start bar
                                          Container(
                                            height: 14.0,
                                            width: 6.0,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(16.0),
                                                  bottomRight: Radius.circular(16.0),
                                                ),
                                                color: Colors.deepOrange
                                            ),
                                          ),


                                          SizedBox(height: 8.0),
                                          Text("W",
                                            style: TextStyle(
                                              fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600,
                                            ),
                                          ),

                                          SizedBox(height: 4.0),
                                        ],
                                      ),
                                    ),

                                    // T
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          // 1 bar

                                          // end bar
                                          Container(
                                            margin: EdgeInsets.only(bottom: 2.0),
                                            height: 14.0,
                                            width: 6.0,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(16.0),
                                                  topRight: Radius.circular(16.0),
                                                ),
                                                color: Colors.deepOrange
                                            ),
                                          ),

                                          // middle bar
                                          Container(
                                            margin: EdgeInsets.only(bottom: 2.0),
                                            height: 14.0,
                                            width: 6.0,
                                            color: Colors.deepOrange,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 2.0),
                                            height: 14.0,
                                            width: 6.0,
                                            color: Colors.deepOrange,
                                          ),

                                          // start bar
                                          Container(
                                            height: 14.0,
                                            width: 6.0,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(16.0),
                                                  bottomRight: Radius.circular(16.0),
                                                ),
                                                color: Colors.deepOrange
                                            ),
                                          ),


                                          SizedBox(height: 8.0),
                                          Text("T",
                                            style: TextStyle(
                                              fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600,
                                            ),
                                          ),

                                          SizedBox(height: 4.0),
                                        ],
                                      ),
                                    ),

                                    // F
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          // 1 bar

                                          // end bar
                                          Container(
                                            margin: EdgeInsets.only(bottom: 2.0),
                                            height: 14.0,
                                            width: 6.0,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(16.0),
                                                  topRight: Radius.circular(16.0),
                                                ),
                                                color: Colors.deepOrange
                                            ),
                                          ),

                                          // start bar
                                          Container(
                                            height: 14.0,
                                            width: 6.0,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(16.0),
                                                  bottomRight: Radius.circular(16.0),
                                                ),
                                                color: Colors.deepOrange
                                            ),
                                          ),


                                          SizedBox(height: 8.0),
                                          Text("F",
                                            style: TextStyle(
                                              fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600,
                                            ),
                                          ),

                                          SizedBox(height: 4.0),
                                        ],
                                      ),
                                    ),

                                    // S
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          // 1 bar

                                          // end bar
                                          Container(
                                            margin: EdgeInsets.only(bottom: 2.0),
                                            height: 14.0,
                                            width: 6.0,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(16.0),
                                                  topRight: Radius.circular(16.0),
                                                ),
                                                color: Colors.deepOrange
                                            ),
                                          ),

                                          // middle bar
                                          Container(
                                            margin: EdgeInsets.only(bottom: 2.0),
                                            height: 14.0,
                                            width: 6.0,
                                            color: Colors.deepOrange,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 2.0),
                                            height: 14.0,
                                            width: 6.0,
                                            color: Colors.deepOrange,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 2.0),
                                            height: 14.0,
                                            width: 6.0,
                                            color: Colors.deepOrange,
                                          ),

                                          // start bar
                                          Container(
                                            height: 14.0,
                                            width: 6.0,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(16.0),
                                                  bottomRight: Radius.circular(16.0),
                                                ),
                                                color: Colors.deepOrange
                                            ),
                                          ),


                                          SizedBox(height: 8.0),
                                          Text("S",
                                            style: TextStyle(
                                              fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600,
                                            ),
                                          ),

                                          SizedBox(height: 4.0),
                                        ],
                                      ),
                                    ),

                                    // S
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          // 1 bar

                                          // end bar
                                          Container(
                                            margin: EdgeInsets.only(bottom: 2.0),
                                            height: 14.0,
                                            width: 6.0,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(16.0),
                                                  topRight: Radius.circular(16.0),
                                                ),
                                                color: Colors.deepOrange
                                            ),
                                          ),

                                          // start bar
                                          Container(
                                            height: 14.0,
                                            width: 6.0,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(16.0),
                                                  bottomRight: Radius.circular(16.0),
                                                ),
                                                color: Colors.deepOrange
                                            ),
                                          ),


                                          SizedBox(height: 8.0),
                                          Text("S",
                                            style: TextStyle(
                                              fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600,
                                            ),
                                          ),

                                          SizedBox(height: 4.0),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),

                              // different size texts
                              // text align
                              Align(
                                alignment: Alignment.center,
                                child: RichText(
                                  text: TextSpan(children: [
                                    // stats
                                    TextSpan(text: "stats",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    // by
                                    TextSpan(text: " by ",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),

                                    // day
                                    TextSpan(text: "stats",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // right : image
                        Flexible(
                          flex: 3,
                          child: Image.asset("assets/fitness_image.PNG", fit: BoxFit.contain),
                        ),
                      ],
                    ),
                  ),

                  // bottom contaienr : today ~~~~~
                  // title
                  Text("Today".toUpperCase(),
                  style: TextStyle(
                    fontSize: 28.0, color: Colors.grey, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 8.0),
                  Container(
                    height: 400.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.white,
                    ),
                    
                    // listview.separated !! 
                    child: ListView.separated(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                      itemCount: todayList.length,
                        itemBuilder: (context, index){
                          return Container(
                            padding: EdgeInsets.all(padding * 0.50),
                            height: 85.0,
                            child: Row(
                              children: <Widget>[
                                // icon in container
                                Container(
                                  margin: EdgeInsets.only(right: padding),
                                  height: 85.0 - padding *1.5,
                                  width: 85.0 - padding *1.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: todayList[index].color.withOpacity(0.2),
                                  ),
                                  child: Center(
                                      child: Icon(todayList[index].icon, size: 24.0, color: todayList[index].color),
                                  ),
                                ),

                                // text
                                Text(todayList[index].text,
                                style: TextStyle(
                                  fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w400,
                                ),
                                ),

                                Spacer(),
                                
                                // check?
                                // == true?
                                todayList[index].isSelected?
                                Icon(Icons.check_circle, size: 40.0, color: Color.fromRGBO(11, 221, 89, 1))
                                // == false?
                                : Icon(Icons.add_circle_outline, size: 40.0, color: Colors.indigo),
                              ],
                            ),
                          );
                        },
                      // divider
                        separatorBuilder: (context, _){
                          return Divider(
                            height: 2.0,
                            color: Colors.grey,
                          );
                        },
                        ),
                  ),
                ],
              ),
          ),
        ),
      ),

      // bottomnavi
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
          child: Row(
            children: <Widget>[
              MyCustomBottomItem(
                icon: Icons.home,
                isBadge: false,
                text: "Home",
                isSelected: _currentIndex == 0,
                onPressed: (){
                setState(() {
                  _onPressed(0);
                });
              },
              ),

              MyCustomBottomItem(
                icon: Icons.broken_image,
                isBadge: false,
                text: "Stats",
                isSelected:  _currentIndex == 1,
                onPressed: (){
                  setState(() {
                    _onPressed(1);
                  });
                },
              ),

              // floating btn
              MyCustomBottomItem(
                icon: Icons.close,
                isBadge: false,
                text: "Log",
                isSelected: false,
                onPressed: (){},
              ),

              MyCustomBottomItem(
                icon: Icons.ring_volume,
                isBadge: true,
                text: "Trainer",
                isSelected: _currentIndex == 2,
                onPressed: (){
                  setState(() {
                    _onPressed(2);
                  });
                },
              ),

              MyCustomBottomItem(
                icon: Icons.person,
                isBadge: false,
                text: "Me",
                isSelected: _currentIndex == 3,
                onPressed: (){
                  setState(() {
                    _onPressed(3);
                  });
                },
              ),
            ],
          ),
        ),
      ),

      // floating btn
      floatingActionButton: Container(
        height: 80.0,
        width: 80.0,
        child: FloatingActionButton(
          onPressed: (){},
          backgroundColor: Colors.indigo,
          child: Icon(Icons.add, size: 40.0, color: Colors.white),
        ),
      ),

      // floating btn location
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// today list
class TodayList {
  Color color;
  IconData icon;
  String text;
  bool isSelected;
  
  TodayList({this.color, this.icon, this.text, this.isSelected});
}

List<TodayList> todayList = [
  TodayList(color: Color.fromRGBO(84, 56, 220, 1), icon: FontAwesomeIcons.shoppingBag, text: "Weight", isSelected: true),
  TodayList(color: Color.fromRGBO(255, 98, 0, 1), icon: FontAwesomeIcons.smile, text: "Mood", isSelected: false),
  TodayList(color: Color.fromRGBO(19, 193, 216, 1), icon: FontAwesomeIcons.mugHot, text: "Meals", isSelected: false),

  //
  TodayList(color: Color.fromRGBO(84, 56, 220, 1), icon: FontAwesomeIcons.shoppingBag, text: "Weight", isSelected: true),
  TodayList(color: Color.fromRGBO(255, 98, 0, 1), icon: FontAwesomeIcons.smile, text: "Mood", isSelected: false),
  TodayList(color: Color.fromRGBO(19, 193, 216, 1), icon: FontAwesomeIcons.mugHot, text: "Meals", isSelected: false),
];























