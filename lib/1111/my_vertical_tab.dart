import 'package:flutter/material.dart';

class MyVerticalTab extends StatelessWidget {
  final String text;

  MyVerticalTab({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Transform.rotate(
          angle: -1.56,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
