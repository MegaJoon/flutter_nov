import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String text;
  final Color color;
  final bool isSelected;
  final Function onPressed;

  MyTab({this.text, this.color, this.isSelected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(right: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text,
            style: TextStyle(fontSize: 20.0, color: isSelected? Colors.black : Colors.black12, fontWeight: FontWeight.w600),
            ),

            Container(
              margin: EdgeInsets.only(top: 6.0),
              height: 8.0,
              width: 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle, color: isSelected? color : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
