import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onPressed;

  CustomTab({this.text, this.isSelected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color _tabColor = Color.fromRGBO(224, 237, 233, 1);
    Color _list1Color = Color.fromRGBO(30, 57, 50, 1);

    return Transform.rotate(
      angle: -1.56,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 24.0),
          height: 50.0,
//          width: 200.0,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(text,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: _list1Color,
                    fontWeight: isSelected? FontWeight.bold : FontWeight.w300,
                    fontFamily: "Gibson-Regular"
                  ),
                ),

                Container(
                  height: 8.0,
                  width: 8.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected? _list1Color : _tabColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
