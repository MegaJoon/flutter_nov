import 'package:flutter/material.dart';

class CustomMessageBox extends StatelessWidget {
  final bool isSend;
  final String content;
  final String time;

  CustomMessageBox({this.isSend, this.content, this.time});

  @override
  Widget build(BuildContext context) {
    Color _leftColor = Color.fromRGBO(94, 124, 235, 1);
    Color _rightContainerColor =
        Color.fromRGBO(68, 53, 255, 1).withOpacity(0.8);

    return Column(
      crossAxisAlignment: isSend? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 16.0),
          alignment: isSend ? Alignment.centerLeft : Alignment.centerRight,
//          height: 64.0,
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.all(12.0),
//            height: 64.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                bottomLeft: isSend ? Radius.circular(0.0) : Radius.circular(24.0),
                topRight: Radius.circular(24.0),
                bottomRight: isSend ? Radius.circular(24.0) : Radius.circular(0.0),
              ),

              color: isSend ? Colors.black12 : _rightContainerColor,
            ),

            child: Text(
              content,
              style: TextStyle(
                fontSize: 16.0,
                color: isSend ? _leftColor : Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),

        Text(time,
        style: TextStyle(
          fontSize: 14.0, color: Colors.black12,
          fontWeight: FontWeight.bold,
        ),
        ),
      ],
    );
  }
}
