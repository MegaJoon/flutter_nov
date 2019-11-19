import 'package:flutter/material.dart';

// https://dribbble.com/shots/8294981/attachments/638559?mode=media

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  // change mode
  bool modeChange = false; // normal

  // change color
  bool colorChange = false;

  // Darkmode - Color list
  Color _backgroundColor = Color.fromRGBO(46, 46, 46, 1);
  Color _containerColor = Color.fromRGBO(40, 40, 40, 1);
  Color _textColor = Colors.white;

  // normal mode - Color list
  Color _normalModeBackgroundColor = Colors.grey[100];
  Color _normalModeContainerColor = Colors.white;
  Color _normalModeTextColor = Colors.black;

  // title
  String title = "Good evening,\nJack";

  double padding = 12.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: modeChange? _backgroundColor : _normalModeBackgroundColor,
      // body
      body: Stack(
        children: <Widget>[
          // content
          Column(
            children: <Widget>[
              // appbar title
              SafeArea(
                top: true,
                left: true,
                right: true,
                child: Container(
                  padding: EdgeInsets.only(left: padding, right: padding),
                  alignment: Alignment.centerLeft,
                  height: 100.0,
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 32.0,
                        color: modeChange? _textColor : _normalModeTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // pick date
              Container(
                padding: EdgeInsets.only(left: padding, right: padding),
                margin: EdgeInsets.all(padding),
                height: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: modeChange? _containerColor: _normalModeContainerColor,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 52.0,
                            width: 52.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorChange? habitList[0].color.withOpacity(0.8) : habitList[1].color.withOpacity(0.8),
                            ),
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: _textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            "Mon",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: modeChange? _textColor : Colors.grey,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),

                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 52.0,
                            width: 52.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorChange? habitList[0].color.withOpacity(0.8) : habitList[1].color.withOpacity(0.8),
                            ),
                            child: Center(
                              child: Text(
                                "3",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: _textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            "Tue",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: modeChange? _textColor : Colors.grey,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: padding * 0.5),

                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 56.0,
                            width: 56.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: colorChange? habitList[0].color : habitList[1].color,
                            ),
                            child: Center(
                              child: Text(
                                "4",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: _textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            "Wed",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: modeChange? _textColor : _normalModeTextColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),


                    SizedBox(width: padding * 0.5),

                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 52.0,
                            width: 52.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorChange? habitList[0].color : habitList[1].color,
                            ),
                            child: Center(
                              child: Text(
                                "5",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: _textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            "Thu",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: modeChange? _textColor : Colors.grey,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),

                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 52.0,
                            width: 52.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorChange? habitList[0].color.withOpacity(0.8) : habitList[1].color.withOpacity(0.8),
                            ),
                            child: Center(
                              child: Text(
                                "6",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: _textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            "Fri",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: modeChange? _textColor : Colors.grey,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

             // your habits
             Container(
               padding: EdgeInsets.only(left: padding),
//               margin: EdgeInsets.only(top: padding),
               height: 190.0,
               child: Column(
                 children: <Widget>[
                   Row(
                     children: <Widget>[
                       Text("Your habits",
                         style: TextStyle(
                             fontSize: 24.0,
                             color: modeChange? _textColor : _normalModeTextColor,
                             fontWeight: FontWeight.bold),
                       ),

                       Spacer(),

                       Container(
                         margin: EdgeInsets.only(right: padding),
                         height: 24.0,
                         width: 24.0,
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: colorChange? habitList[0].color : habitList[1].color,
                         ),
                         child: Center(
                             child: Icon(Icons.add, size: 16.0, color: _textColor)),
                       ),
                     ],
                   ),

                   // listview
                   Container(
                     height: 160.0,
                     child: ListView.builder(
                         padding: EdgeInsets.only(top: padding),
                         scrollDirection: Axis.horizontal,
                         itemCount: habitList.length,
                         shrinkWrap: true,
                         itemBuilder: (BuildContext context, int index){
                           return Container(
                             padding: EdgeInsets.all(padding),
                             margin: EdgeInsets.only(right: padding *2),
                             width: 150.0,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(40.0),
                               color: habitList[index].color,
                             ),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: <Widget>[
                                 // icon
                                 Container(
                                   height: 40.0,
                                   width: 40.0,
                                   decoration: BoxDecoration(
                                     shape: BoxShape.circle,
                                     color: Colors.black12,
                                   ),
                                   child: Center(
                                       child: Icon(habitList[index].icon, size: 24.0, color: _textColor)),
                                 ),

                                 Spacer(),

                                 // text
                                 Text(habitList[index].title,
                                 style: TextStyle(
                                   fontSize: 22.0, color: _textColor, fontWeight: FontWeight.bold
                                 ),
                                 ),

                                 // percent
                                 Container(
                                   margin: EdgeInsets.only(top: 8.0, bottom: 8.0, right: padding),
                                   height: 6.0,
                                   decoration: BoxDecoration(
                                     color: _containerColor,
                                     borderRadius: BorderRadius.circular(16.0)
                                   ),
                                   child: Container(
                                     margin: EdgeInsets.only(right: padding * habitList[index].percent),
                                     color: _textColor,
                                   ),
                                 ),

                                 // sheet
                                 Text(habitList[index].sheets, style: TextStyle(fontSize: 16.0, color: _textColor.withOpacity(0.8),
                                     fontWeight: FontWeight.bold),
                                 ),
                               ],
                             ),
                           );
                         }),
                   ),
                 ],
               ),
             ),

              // today's tasks
              Container(
                padding: EdgeInsets.only(left: padding, right: padding),
                margin: EdgeInsets.only(top: padding),
                height: 190.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // title
                    Text("Today's tasks",
                    style: TextStyle(
                      fontSize: 24.0,
                        color: modeChange? _textColor : _normalModeTextColor,
                        fontWeight: FontWeight.bold),
                    ),

                    // container
                    Container(
                      padding: EdgeInsets.all(padding * 0.5),
                      height: 44.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: modeChange? _containerColor : _normalModeContainerColor,
                      ),
                      child: Row(
                        children: <Widget>[
                          // check-icon container
                          Container(
                            margin: EdgeInsets.only(right: padding),
                            height: 28.0,
                            width: 28.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: colorChange? habitList[0].color : habitList[1].color,
                            ),
                            child: Center(
                                child: Icon(Icons.check, size: 24.0, color: _textColor),
                            ),
                          ),

                          // text
                          Text("Buy food for dinner",
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(padding * 0.5),
                      height: 44.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: modeChange? _containerColor : _normalModeContainerColor,
                      ),
                      child: Row(
                        children: <Widget>[
                          // check container
                          Container(
                            margin: EdgeInsets.only(right: padding),
                            height: 28.0,
                            width: 28.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                  color: colorChange? habitList[0].color : habitList[1].color,
                                width: 2.0
                              ),
                            ),
                          ),

                          // text
                          Text("Call Marie",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: modeChange? _textColor: _normalModeTextColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(padding * 0.5),
                      height: 44.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: modeChange? _containerColor : _normalModeContainerColor,
                      ),
                      child: Row(
                        children: <Widget>[
                          // check container
                          Container(
                            margin: EdgeInsets.only(right: padding),
                            height: 28.0,
                            width: 28.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                  color: colorChange? habitList[0].color : habitList[1].color,
                                  width: 2.0
                              ),
                            ),
                          ),

                          // text
                          Text("Go to the gym",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: modeChange? _textColor: _normalModeTextColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: padding *2),
              height: 48.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                color: modeChange? _containerColor : _normalModeContainerColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      setState(() {
                        // dark mode - normal mode
                        modeChange = !modeChange;
                      });
                    },
                    icon: Icon(Icons.home,
                        size: 36.0, color: modeChange? _textColor : _normalModeTextColor),
                  ),

                  FloatingActionButton(
                    onPressed: (){
                      //
                    },
                    backgroundColor:
    colorChange? habitList[0].color : habitList[1].color,
                    child: Icon(Icons.add, size: 28.0, color: _textColor),
                  ),

                  IconButton(
                    onPressed: (){
                      setState(() {
                        // change color : habitlist[0].color - habitlist[1].color
                        colorChange = !colorChange;
                      });
                    },
                    icon: Icon(Icons.person,
                        size: 36.0, color: modeChange? _textColor : _normalModeTextColor),
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

class HabitList {
  Color color;
  IconData icon;
  String title;
  double percent;
  String sheets;

  HabitList({this.color, this.icon, this.title, this.percent, this.sheets});
}

List<HabitList> habitList = [
  HabitList(color: Color.fromRGBO(68, 63, 121, 1), icon: Icons.library_books, title: "Reading", percent: 0.8, sheets: "156 Sheets"),
  HabitList(color: Color.fromRGBO(224, 124, 124, 1), icon: Icons.directions_walk, title: "Walking", percent: 1.5, sheets: "3567 Steps"),
  HabitList(color: Color.fromRGBO(242, 162, 101, 1), icon: Icons.watch, title: "Watching", percent: 1, sheets: "20 Movies"),
  //
  HabitList(color: Color.fromRGBO(68, 63, 121, 1), icon: Icons.library_books, title: "Reading", percent: 0.8, sheets: "156 Sheets"),
  HabitList(color: Color.fromRGBO(224, 124, 124, 1), icon: Icons.directions_walk, title: "Walking", percent: 1.5, sheets: "3567 Steps"),
  HabitList(color: Color.fromRGBO(242, 162, 101, 1), icon: Icons.watch, title: "Watching", percent: 1, sheets: "20 Movies"),
];


















