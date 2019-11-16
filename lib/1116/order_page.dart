import 'package:flutter/material.dart';
import 'package:flutter_nov/1116/order_number_page.dart';
import 'package:flutter_nov/1116/product_list.dart';

class OrderPage extends StatefulWidget {
  final int index;

  OrderPage(this.index);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  double padding = 24.0;

  // total price
  int itemCount = 1;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      // appbar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(52.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            icon: Icon(Icons.arrow_back, size: 28.0, color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person_outline, size: 28.0, color: Colors.black),
            ),
          ],
        ),
      ),

      // main
      body: Stack(
        children: <Widget>[
          // color container
          Positioned(
            top: MediaQuery.of(context).size.height * 0.30,
            left: 0,
            right: 0,
            bottom: 0,
            child: Hero(
              tag: "color ${widget.index}",
              child: Container(
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
          ),

          // image
          Positioned(
            top: 48.0,
            left: 0,
            right: 0,
            child: Hero(
                tag: "image ${widget.index}",
                child: Image.asset(productList[widget.index].image,
                    fit: BoxFit.contain,
                height: 300.0,)),
          ),

          // text column
          Positioned(
            top: MediaQuery.of(context).size.height * 0.50,
            left: 0,
            right: 0,
            bottom: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // title
                Text(
                  productList[widget.index].title,
                  style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),

                // price
                Container(
                  height: 52.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.black),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "\$",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        (10 * itemCount).toString(),
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),

                // item cnt
                Container(
                  height: 48.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if(itemCount ==1){
                                  _scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                        content: Text("it's minimum count. plz check it.."),
                                        action: SnackBarAction(
                                          label: "Undo",
                                          onPressed: (){},
                                        ),
                                        duration: Duration(milliseconds: 2000),
                                      ));
                                } else itemCount--;
                              });
                            },
                            icon: Icon(Icons.remove,
                                size: 28.0, color: Colors.black),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Center(
                          child: Text(
                            itemCount.toString(),
                            style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                itemCount++;
                              });
                            },
                            icon: Icon(Icons.add,
                                size: 28.0, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // order now
                InkWell(
                  onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OrderNumberPage(widget.index)));
                    });
                  },
                  child: Container(
                    height: 48.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: productList[0].color),
                    child: Center(
                      child: Text("Order Now",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                      ),
                    ),
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
