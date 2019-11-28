import 'package:flutter/material.dart';
import 'package:flutter_nov/1128/blu_item_list.dart';

class ItemDetailPage extends StatefulWidget {
  final int index;

  ItemDetailPage(this.index);

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  double padding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Column(
          children: <Widget>[
            // appbar
            Container(
              height: 52.0,
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, size: 28.0, color: Colors.black),
                  ),
                ],
              ),
            ),

            // top image
            Flexible(
              flex: 2,
              child: Stack(
                children: <Widget>[
                  // image
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: padding *2,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(bluList[widget.index].profileImage),
                          fit: BoxFit.fill,
                        ),

                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 1,
                        )],
                      ),
                    ),
                  ),

                  // circle image
                  Positioned(
                   left: padding *2,
                    bottom: 2.0,
                    child: Hero(
                      tag: "item ${widget.index}",
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(bluList[widget.index].profileImage),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 1,
                          )],
                        ),
//                      child: Placeholder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // bottom image
            Flexible(
              flex: 3,
              child: Placeholder(),
            ),
          ],
        ),
      ),
    );
  }
}
