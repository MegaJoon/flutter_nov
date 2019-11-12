import 'package:flutter/material.dart';
import 'package:flutter_nov/1112/place_item_list.dart';

class ThirdTravelPage extends StatefulWidget {
  final int index;

  ThirdTravelPage(this.index);

  @override
  _ThirdTravelPageState createState() => _ThirdTravelPageState();
}

class _ThirdTravelPageState extends State<ThirdTravelPage> {
  Color _color = Color.fromRGBO(92, 104, 190, 1);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // top container : Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Hero(
              tag: "travel ${widget.index}",
              child: Container(
                height: screenHeight * 0.40,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(placeItemList[widget.index].image), fit: BoxFit.fill),
                ),
              ),
            ),
          ),

          // appbar
          Positioned(
            top: 0,
            left: 24.0,
            right: 24.0,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Container(
                height: 64.0,
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.sort, size: 32.0, color: Colors.white),
                      onPressed: (){
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                    ),
                    Spacer(),
                    IconButton(icon: Icon(Icons.more_vert, size: 32.0, color: Colors.white),
                      onPressed: (){},
                    ),
                  ],
                ),
              ),
            ),
          ),

          // white container
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(24.0),
              height: screenHeight * 0.65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0),
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // text
                  Row(
                    children: <Widget>[
                      Text(placeItemList[widget.index].text,
                      style: TextStyle(fontSize: 28.0, color: Colors.black, fontWeight: FontWeight.bold),
                      ),

                      Spacer(),

                      Text(placeItemList[widget.index].price,
                        style: TextStyle(fontSize: 32.0, color: _color, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  // location
                  Row(
                    children: <Widget>[
                      Icon(Icons.location_on, size: 20.0, color: _color),

                      SizedBox(width: 4.0),

                      Text(placeItemList[widget.index].address,
                        style: TextStyle(fontSize: 14.0, color: _color, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),

                  // score
                  Row(
                    children: <Widget>[
                      Icon(Icons.star, size: 16.0, color: Colors.amber),
                      Icon(Icons.star, size: 16.0, color: Colors.amber),
                      Icon(Icons.star, size: 16.0, color: Colors.amber),
                      Icon(Icons.star, size: 16.0, color: Colors.amber),
                      Icon(Icons.star_border, size: 16.0, color: Colors.black12),
                      Text("(4.0)",
                        style: TextStyle(fontSize: 16.0, color: Colors.black12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.0),

                  // text : people
                  Text("People",
                  style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w600),
                  ),

                  Text("Number of people in your group",
                    style: TextStyle(fontSize: 16.0, color: Colors.black12, fontWeight: FontWeight.w600),
                  ),

                  // people choice container
                  Row(
                    children: <Widget>[
                      // 1
                      Container(
                        margin: EdgeInsets.only(right: 8.0),
                        height: 48.0,
                        width: 48.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                            child: Text("1",
                            style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
                            ),
                        ),
                      ),

                      // 2
                      Container(
                        margin: EdgeInsets.only(right: 8.0),
                        height: 48.0,
                        width: 48.0,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text("2",
                            style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),

                      // 3
                      Container(
                        margin: EdgeInsets.only(right: 8.0),
                        height: 48.0,
                        width: 48.0,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text("3",
                            style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),

                      // 4
                      Container(
                        margin: EdgeInsets.only(right: 8.0),
                        height: 48.0,
                        width: 48.0,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text("4",
                            style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),

                      // 5
                      Container(
                        margin: EdgeInsets.only(right: 8.0),
                        height: 48.0,
                        width: 48.0,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text("5",
                            style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.0),

                  // text : description
                  Text("Description",
                    style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  Text(placeItemList[widget.index].description,
                    style: TextStyle(fontSize: 16.0, color: Colors.black12, fontWeight: FontWeight.w600),
                  ),

                  SizedBox(height: 32.0),

                  // favorite icon, book trip now container
                  Row(
                    children: <Widget>[
                      // favorite icon container
                      Container(
                        height: 52.0,
                        width: 52.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: _color, width: 1.0)
                        ),
                        child: Center(
                            child: Icon(Icons.favorite_border, size: 24.0, color: _color),
                        ),
                      ),

                      Spacer(),

                      // book container
                      Container(
                        height: 52.0,
                        width: 280.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: _color
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            // text
                            Text("Book Trip Now",
                            style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
                            ),

                            // arrow icons
                            Container(
                              height: 52.0,
                              width: 80.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(8.0),
                                color: _color,
                              ),
                              // arrow icons
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    top: 20.0,
                                    left: 22.0,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 12.0,
                                      color: Colors.white
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  Positioned(
                                    top: 18.0,
                                    left: 32.0,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16.0,
                                      color: Colors.white
                                          .withOpacity(0.7),
                                    ),
                                  ),
                                  Positioned(
                                    top: 16.0,
                                    left: 42.0,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20.0,
                                      color: Colors.white
                                          .withOpacity(0.8),
                                    ),
                                  ),
                                  Positioned(
                                    top: 15.0,
                                    left: 52.0,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 22.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),










                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
