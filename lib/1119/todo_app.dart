import 'package:flutter/material.dart';

// https://dribbble.com/shots/8294981/attachments/638559?mode=media

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  // Color list
  Color _backgroundColor = Color.fromRGBO(46, 46, 46, 1);
  Color _containerColor = Color.fromRGBO(40, 40, 40, 1);
  Color _textColor = Colors.white;

  List<Color> habitColor = [
    Color.fromRGBO(68, 63, 121, 1),
    Color.fromRGBO(224, 124, 124, 1),
    Color.fromRGBO(242, 162, 101, 1),
  ];

  // title
  String title = "Good evening,\nJack";

  double padding = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
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
                  padding: EdgeInsets.only(top: padding, left: padding, right: padding),
                  alignment: Alignment.centerLeft,
                  height: 120.0,
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 32.0,
                        color: _textColor,
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
                  color: _containerColor,
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
                              color: habitColor[1].withOpacity(0.8),
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
                                color: _textColor,
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
                              color: habitColor[1].withOpacity(0.8),
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
                                color: _textColor,
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
                              color: habitColor[1],
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
                                color: _textColor,
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
                              color: habitColor[1].withOpacity(0.8),
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
                                color: _textColor,
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
                              color: habitColor[1].withOpacity(0.8),
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
                                color: _textColor,
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
               height: 220.0,
               child: Placeholder(),
             ),

              // today's tasks
              Container(
                padding: EdgeInsets.only(left: padding, right: padding),
                margin: EdgeInsets.only(top: padding),
                height: 220.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // title
                    Text("Today's tasks",
                    style: TextStyle(
                      fontSize: 24.0, color: _textColor, fontWeight: FontWeight.bold),
                    ),

                    // container
                    Container(
                      padding: EdgeInsets.all(padding * 0.5),
                      height: 52.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: _containerColor,
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
                              color: habitColor[1],
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
                      height: 52.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: _containerColor,
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
                                color: habitColor[1],
                                width: 2.0
                              ),
                            ),
                          ),

                          // text
                          Text("Call Marie",
                            style: TextStyle(
                                fontSize: 16.0, color: _textColor, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(padding * 0.5),
                      height: 52.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: _containerColor,
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
                                  color: habitColor[1],
                                  width: 2.0
                              ),
                            ),
                          ),

                          // text
                          Text("Go to the gym",
                            style: TextStyle(
                                fontSize: 16.0, color: _textColor, fontWeight: FontWeight.w400),
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
              height: 64.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                color: _containerColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.home, size: 36.0, color: _textColor),
                  ),

                  FloatingActionButton(
                    onPressed: (){},
                    backgroundColor: habitColor[1],
                    child: Icon(Icons.add, size: 28.0, color: _textColor),
                  ),

                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.person, size: 36.0, color: _textColor),
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
