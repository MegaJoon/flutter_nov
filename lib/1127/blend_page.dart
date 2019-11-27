import 'package:flutter/material.dart';
import 'package:flutter_nov/1127/starbuck_list.dart';

class BlendPage extends StatefulWidget {
  final int index;

  BlendPage(this.index);

  @override
  _BlendPageState createState() => _BlendPageState();
}

class _BlendPageState extends State<BlendPage> {
  String title = "Starbucks";

  double padding = 16.0;

  String _value = "1";

  // color list
  Color _tabColor = Color.fromRGBO(224, 237, 233, 1);
  Color _list1Color = Color.fromRGBO(30, 57, 50, 1);
  Color _list2Color = Color.fromRGBO(197, 40, 54, 1);
  Color _list3Color = Color.fromRGBO(0, 112, 74, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // appbar
          SafeArea(
            top: true,
            left: true,
            right: true,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: padding),
              height: 52.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // shopping bag icon in container
                  InkWell(
                    onTap: (){
                      // close page
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          size: 20.0,
                          color: _list1Color,
                        ),
                      ),
                    ),
                  ),

                  // title text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        title.toUpperCase(),
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "gibson-bold",
                        ),
                      ),

                      Text(
                        "99 Kingsway, Holborn, London",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: _tabColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "gibson-bold",
                        ),
                      ),
                    ],
                  ),

                  // spacer
                  Container(
                    height: 40.0,
                    width: 40.0,
                  ),
                ],
              ),
            ),
          ),

          Flexible(
            fit: FlexFit.tight,
            child: Container(
              margin: EdgeInsets.only(top: padding *2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
//                color: _tabColor,
                gradient: LinearGradient(
                  colors: [_list1Color,
                    _list1Color,
                    Colors.white,
                    Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment(-0.6, -0.7),
                  stops: [0.0, 0.5, 0.5, 1.0],
                  tileMode: TileMode.repeated,
                ),
              ),
//              child: Placeholder(),

            child: Stack(
              children: <Widget>[
                // center image
                Positioned(
                  top: -200.0,
                    left: -50.0,
                    right: -50.0,
                    bottom: 0,
                    child: Hero(
                      tag: "starbucks ${widget.index}",
                      child: Image.asset(startbucks[widget.index].image,
                      fit: BoxFit.contain,
                      ),
                    ),
                ),

                // tab color container
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.only(top: padding),
                    height: 350.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                      ),
                      color: _tabColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: padding),
                          height: 200.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Customize text
                              Text("Customize your drink",
                                style: TextStyle(
                                  fontSize: 20.0, color: _list1Color, fontWeight: FontWeight.w400,
                                  fontFamily: "Gibson-Regular",
                                ),
                              ),

                              // selected item name
                              Text("Chestnut Praline Latte",
                                style: TextStyle(
                                  fontSize: 14.0, color: _list1Color.withOpacity(0.5), fontWeight: FontWeight.w400,
                                  fontFamily: "Gibson-Regular",
                                ),
                              ),

                              Spacer(),

                              // size
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Size",
                                    style: TextStyle(
                                      fontSize: 20.0, color: _list1Color, fontWeight: FontWeight.bold,
                                      fontFamily: "Gibson-Regular",
                                    ),
                                  ),

                                  Spacer(),

                                  Container(
                                    alignment: Alignment.centerRight,
                                    height: 32.0,
                                    width: 200.0,
                                    child: DropdownButton(
                                      items: [
                                        DropdownMenuItem(
                                          value: "1",
                                          child: Text("Grande L",
                                            style: TextStyle(
                                              fontSize: 20.0, color: _list3Color, fontWeight: FontWeight.w400,
                                              fontFamily: "Gibson-Regular",
                                            ),
                                          ),
                                        ),

                                        DropdownMenuItem(
                                          value: "2",
                                          child: Text("Second",
                                            style: TextStyle(
                                              fontSize: 20.0, color: _list3Color, fontWeight: FontWeight.w400,
                                              fontFamily: "Gibson-Regular",
                                            ),
                                          ),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          _value = value;
                                        });
                                      },

                                      value: _value,

                                      icon: Icon(Icons.keyboard_arrow_down, size: 24.0, color: _list3Color,),
                                    ),
                                  ),
                                ],
                              ),

                              // milk
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Milk",
                                    style: TextStyle(
                                      fontSize: 20.0, color: _list1Color, fontWeight: FontWeight.bold,
                                      fontFamily: "Gibson-Regular",
                                    ),
                                  ),

                                  Spacer(),

                                  Container(
                                    alignment: Alignment.centerRight,
                                    height: 32.0,
                                    width: 200.0,
                                    child: DropdownButton(
                                      items: [
                                        DropdownMenuItem(
                                          value: "1",
                                          child: Text("Coconut",
                                            style: TextStyle(
                                              fontSize: 20.0, color: _list3Color, fontWeight: FontWeight.w400,
                                              fontFamily: "Gibson-Regular",
                                            ),
                                          ),
                                        ),

                                        DropdownMenuItem(
                                          value: "2",
                                          child: Text("Second",
                                            style: TextStyle(
                                              fontSize: 20.0, color: _list3Color, fontWeight: FontWeight.w400,
                                              fontFamily: "Gibson-Regular",
                                            ),
                                          ),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          _value = value;
                                        });
                                      },

                                      value: _value,

                                      icon: Icon(Icons.keyboard_arrow_down, size: 24.0, color: _list3Color,),
                                    ),
                                  ),
                                ],
                              ),

                              // topping
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Toppings",
                                    style: TextStyle(
                                      fontSize: 20.0, color: _list1Color, fontWeight: FontWeight.bold,
                                      fontFamily: "Gibson-Regular",
                                    ),
                                  ),

                                  Spacer(),

                                  Container(
                                    alignment: Alignment.centerRight,
                                    height: 32.0,
                                    width: 200.0,
                                    child: DropdownButton(
                                      items: [
                                        DropdownMenuItem(
                                          value: "1",
                                          child: Text("Caramel syrup",
                                            style: TextStyle(
                                              fontSize: 20.0, color: _list3Color, fontWeight: FontWeight.w400,
                                              fontFamily: "Gibson-Regular",
                                            ),
                                          ),
                                        ),

                                        DropdownMenuItem(
                                          value: "2",
                                          child: Text("Second",
                                            style: TextStyle(
                                              fontSize: 20.0, color: _list3Color, fontWeight: FontWeight.w400,
                                              fontFamily: "Gibson-Regular",
                                            ),
                                          ),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          _value = value;
                                        });
                                      },

                                      value: _value,

                                      icon: Icon(Icons.keyboard_arrow_down, size: 24.0, color: _list3Color,),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Spacer(),

                        // control cnt
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: padding *3),
                          margin: EdgeInsets.only(right: 64.0),
                          height: 52.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(24.0),
                              bottomRight: Radius.circular(24.0),
                            ),
                            color: _list3Color.withOpacity(0.2),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              // -
                              Text("-",
                              style: TextStyle(
                                fontSize: 20.0, color: _list3Color, fontWeight: FontWeight.w600,
                                fontFamily: "Gibson-Regular",
                              ),
                              ),

                              // int num
                              Container(
                                height: 32.0,
                                width: 32.0,
                                decoration: BoxDecoration(
borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text("1", style: TextStyle(
                                    fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w600,
                                  ),
                                  ),
                                ),
                              ),

                              // +
                              Text("+",
                                style: TextStyle(
                                  fontSize: 20.0, color: _list3Color, fontWeight: FontWeight.w600,
                                  fontFamily: "Gibson-Regular",
                                ),
                              ),

                              // divider
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: padding),
                                height: 40.0,
                                width: 2.0,
                                color: Colors.grey,
                              ),

                              // price
                              Text(startbucks[widget.index].price,
                              style: TextStyle(
                                fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold,
                                fontFamily: "Gibson-Regular",
                              ),
                              ),
                            ],
                          ),
                        ),

                        Spacer(),

                        Container(
                          alignment: Alignment.centerRight,
                          height: 52.0,
                          child: Container(
                            width: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0)),
                              color: _list3Color,
                            ),
                            child: Center(
                                child: Text("Blend my drink",
                                  style: TextStyle(
                                    fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w600,
                                    fontFamily: "Gibson-Regular",
                                  ),
                                ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
