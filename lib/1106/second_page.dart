import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // top container
          Flexible(
            flex: 6,
            child: Placeholder(),
          ),

          // bottom container
          Flexible(
            flex: 4,
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
