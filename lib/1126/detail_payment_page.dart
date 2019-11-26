import 'package:flutter/material.dart';
import 'package:flutter_nov/1126/custom_bottom_item.dart';
import 'package:flutter_nov/1126/tool_list.dart';

class DetailPaymentPage extends StatefulWidget {
  final int index;

  DetailPaymentPage(this.index);

  @override
  _DetailPaymentPageState createState() => _DetailPaymentPageState();
}

class _DetailPaymentPageState extends State<DetailPaymentPage> {
  int _currentIndex = 0;  // bottom index

  void _onPressed(int num){
    setState(() {
      _currentIndex = num;
    });
  }

  double padding = 16.0;

  String title = "mbaiar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              // appbar
              Container(
                height: 200.0,
                child: Stack(
                  children: <Widget>[
                    // indigo color container
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 100.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.0),
                          ),
                          color: Colors.indigo,
                        ),
                        child: SafeArea(
                          top: true,
                          left: true,
                          right: true,
                          child: Column(
                            children: <Widget>[
                              // appbar
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IconButton(
                                    onPressed: (){
                                      // on clicked
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.arrow_back, size: 16.0, color: Colors.white),
                                  ),
                                  Text(title,
                                    style: TextStyle(
                                      fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.search, size: 16.0, color: Colors.white),
                                  ),
                                ],
                              ),

                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // your balance container
                    Positioned(
                      left: padding,
                      right: padding,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.all(padding * 0.5),
                        height: 130.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                          boxShadow: [BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 1,
                          )]
                        ),
                        child: Column(
                          children: <Widget>[
                            // which tool
                            Flexible(
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    // tool icon
                                    Container(
                                      padding: EdgeInsets.all(12.0),
                                      margin: EdgeInsets.only(right: padding),
                                      width: 72.0,
                                      child: Image.asset(toolList[widget.index].image, fit: BoxFit.cover),
                                    ),

                                    // text
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(toolList[widget.index].tool,
                                            style: TextStyle(
                                              fontSize: 16.0, color:  Colors.black, fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          SizedBox(height: 8.0),
                                          Text(toolList[widget.index].time,
                                            style: TextStyle(
                                              fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // subscribe btn
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(top: padding),
                                child: Row(
                                  children: <Widget>[
                                    // unsubscribe
                                    Flexible(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4.0),
                                          color: Colors.grey,
                                          boxShadow: [BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 1,
                                            spreadRadius: 1,
                                          )],
                                        ),
                                        child: Center(
                                          child: Text("Unsubscribe",
                                          style: TextStyle(
                                            fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600,
                                          ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: padding),

                                    // update payment
                                    Flexible(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4.0),
                                          color: Colors.green,
                                          boxShadow: [BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 1,
                                            spreadRadius: 1,
                                          )],
                                        ),
                                        child: Center(
                                          child: Text("Update Payment",
                                            style: TextStyle(
                                              fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600,
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
              ),

              // main box
              Container(
                padding: EdgeInsets.only(top: padding, left: padding, right: padding, bottom: padding),
                margin: EdgeInsets.all(padding),
                height: 390.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0),
                  boxShadow: [BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1,
                    spreadRadius: 1,
                  )],
                ),
                child: Column(
                  children: <Widget>[
                    // title
                    Row(
                      children: <Widget>[
                        Text("Payment activity",
                        style: TextStyle(
                          fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600,
                        ),
                        ),

                        Spacer(),

                        Icon(Icons.show_chart, size: 20.0, color: Colors.grey,),
                      ],
                    ),

                    Divider(height: 24.0),

                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(bottom: padding),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // dot
                                  Container(
                                    margin: EdgeInsets.only(top: 2.0, right: 16.0),
                                    height: 8.0,
                                    width: 8.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                  ),

                                  // content
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("9/17/2019",
                                      style: TextStyle(
                                        fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600,
                                      ),
                                      ),

                                      Text("Subscribe for 3 months - mBanking",
                                        style: TextStyle(
                                          fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      Text("Rp. 300,000",
                                        style: TextStyle(
                                          fontSize: 12.0, color: Colors.green, fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(bottom: padding),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // dot
                                  Container(
                                    margin: EdgeInsets.only(top: 2.0, right: 16.0),
                                    height: 8.0,
                                    width: 8.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                  ),

                                  // content
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("9/17/2019",
                                        style: TextStyle(
                                          fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      Text("Subscribe for 3 months - mBanking",
                                        style: TextStyle(
                                          fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      Text("Rp. 300,000",
                                        style: TextStyle(
                                          fontSize: 12.0, color: Colors.green, fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(bottom: padding),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // dot
                                  Container(
                                    margin: EdgeInsets.only(top: 2.0, right: 16.0),
                                    height: 8.0,
                                    width: 8.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                  ),

                                  // content
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("9/17/2019",
                                        style: TextStyle(
                                          fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      Text("Subscribe for 3 months - mBanking",
                                        style: TextStyle(
                                          fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      Text("Rp. 300,000",
                                        style: TextStyle(
                                          fontSize: 12.0, color: Colors.green, fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(bottom: padding),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // dot
                                  Container(
                                    margin: EdgeInsets.only(top: 2.0, right: 16.0),
                                    height: 8.0,
                                    width: 8.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                  ),

                                  // content
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("9/17/2019",
                                        style: TextStyle(
                                          fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      Text("Subscribe for 3 months - mBanking",
                                        style: TextStyle(
                                          fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      Text("Rp. 300,000",
                                        style: TextStyle(
                                          fontSize: 12.0, color: Colors.green, fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(bottom: padding),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // dot
                                  Container(
                                    margin: EdgeInsets.only(top: 2.0, right: 16.0),
                                    height: 8.0,
                                    width: 8.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                  ),

                                  // content
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("9/17/2019",
                                        style: TextStyle(
                                          fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      Text("Subscribe for 3 months - mBanking",
                                        style: TextStyle(
                                          fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      Text("Rp. 300,000",
                                        style: TextStyle(
                                          fontSize: 12.0, color: Colors.green, fontWeight: FontWeight.w600,
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
                    ),
                  ],
                ),
              ),
            ],
          ),

          // bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 64.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.black12, blurRadius: 1, spreadRadius: 1,
                )],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomBottomItem(
                    icon: Icons.home,
                    text: "Home",
                    isSelected: _currentIndex == 0,
                    onPressed: (){
                      _onPressed(0);
                    },
                  ),

                  CustomBottomItem(
                    icon: Icons.child_care,
                    text: "Browse",
                    isSelected: _currentIndex == 1,
                    onPressed: (){
                      _onPressed(1);
                    },
                  ),

                  CustomBottomItem(
                    icon: Icons.mail_outline,
                    text: "InBox",
                    isSelected: _currentIndex == 2,
                    onPressed: (){
                      _onPressed(2);
                    },
                  ),

                  CustomBottomItem(
                    icon: Icons.person_outline,
                    text: "Profile",
                    isSelected: _currentIndex == 3,
                    onPressed: (){
                      _onPressed(3);
                    },
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


