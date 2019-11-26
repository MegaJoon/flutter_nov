import 'package:flutter/material.dart';

class CustomBottomItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final Function onPressed;

  CustomBottomItem({this.icon, this.text, this.isSelected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 64.0,
        width: 64.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // icon
            Icon(icon, size: 28.0, color: isSelected? Colors.indigo : Colors.grey),

            // text
            Text(text,
            style: TextStyle(
              fontSize: 12.0, color: isSelected? Colors.indigo : Colors.grey, fontWeight: FontWeight.w400,
            ),
            ),
          ],
        ),
      ),
    );
  }
}
