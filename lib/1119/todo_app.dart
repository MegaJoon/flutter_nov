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
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: <Widget>[
            // appbar title
            SafeArea(
              top: true,
              left: true,
              right: true,
              child: Container(
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
              padding: EdgeInsets.all(padding * 0.5),
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: _containerColor,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    child: Column(
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
          ],
        ),
      ),
    );
  }
}
