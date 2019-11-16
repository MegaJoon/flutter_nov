import 'package:flutter/material.dart';
import 'package:flutter_nov/1116/product_list.dart';

// https://dribbble.com/shots/6322090-New-Illustrations-Delivery

class OrderNumberPage extends StatefulWidget {
  final int index;

  OrderNumberPage(this.index);

  @override
  _OrderNumberPageState createState() => _OrderNumberPageState();
}

class _OrderNumberPageState extends State<OrderNumberPage> {
  double padding = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // animation
          Flexible(
            flex: 6,
            child: Center(
              child: Image.asset("assets/delivery.gif",
               fit: BoxFit.contain),
            ),
          ),

          // bottom color
          Flexible(
            flex: 4,
            child: Stack(
              children: <Widget>[
                Hero(
                  tag: "color ${widget.index}",
                  child: Container(
                    padding: EdgeInsets.all(padding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0)),
                      gradient: LinearGradient(
                        colors: [
                          productList[widget.index].color.withOpacity(0.6),
                          productList[widget.index].color.withOpacity(0.7),
                          productList[widget.index].color
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: padding,
                  left: 0,
                  right: 0,
                  bottom: padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //
                      Text("Your Order",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Text("On The Way",
                        style: TextStyle(
                          fontSize: 28.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Spacer(),

                      Text("\#78376",
                        style: TextStyle(
                          fontSize: 28.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Text("Order Number",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      Spacer(),

                      Container(
                        height: 64.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: productList[0].color,
                        ),
                        child: Center(
                          child: Text("Check The Receipt",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
    );
  }
}
