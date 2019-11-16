import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onPressed;

  MyTab({this.text, this.isSelected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color _color = Color.fromRGBO(233, 165, 0, 1);

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 100.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // circle container
            isSelected
                ? Container(
                    margin: EdgeInsets.only(right: 8.0),
                    height: 8.0,
                    width: 8.0,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: _color),
                  )
                : Container(),

            // text
            Text(
              text,
              style: TextStyle(
                  fontSize: isSelected ? 14.0 : 12.0,
                  color: isSelected ? _color : Colors.black12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
