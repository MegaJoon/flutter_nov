import 'package:flutter/material.dart';

class MyBottomTab extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final Function onPressed;

  MyBottomTab({this.icon, this.text, this.isSelected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color _color = Color.fromRGBO(255, 101, 37, 1);

    return InkWell(
      onTap: onPressed,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          width: isSelected? 120.0 : 80.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: isSelected? _color.withOpacity(0.8) : Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(icon, size: 28.0, color: Colors.grey[200]),
              isSelected? Text(text,
              style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600),
              ): Container(),
            ],
          ),
        ),
    );
  }
}
