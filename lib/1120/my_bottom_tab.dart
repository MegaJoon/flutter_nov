import 'package:flutter/material.dart';

class MyBottomTab extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final Function onPressed;

  MyBottomTab({this.icon, this.text, this.isSelected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor = Color.fromRGBO(135, 219, 186, 1);

    return InkWell(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        height: isSelected? 56.0 : 48.0,
        width: isSelected? MediaQuery.of(context).size.width - 270.0 : 90.0,
        decoration: BoxDecoration(
//          border: Border.all(color: Colors.black, width: 2.0),
          border: isSelected? Border(
            top: BorderSide(color: Colors.black, width: 2.0),
            left: BorderSide(color: Colors.black, width: 2.0),
            right: BorderSide(color: Colors.black, width: 2.0),
          ) : Border(
            top: BorderSide(color: Colors.black, width: 2.0),
            right: BorderSide(color: Colors.black, width: 2.0),
          ),
          color: _backgroundColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 28.0, color: Colors.black),
            isSelected? SizedBox(width: 8.0) : Container(),
            isSelected? Text(text.toUpperCase(),
              style: TextStyle(
                fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold,
              ),
            ) : Container(),
          ],
        ),
      ),
    );
  }
}
