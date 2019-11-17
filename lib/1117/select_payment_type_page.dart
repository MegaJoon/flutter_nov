import 'package:flutter/material.dart';
import 'package:flutter_nov/1117/select_card_page.dart';

class SelectPaymentTypePage extends StatefulWidget {
  @override
  _SelectPaymentTypePageState createState() => _SelectPaymentTypePageState();
}

class _SelectPaymentTypePageState extends State<SelectPaymentTypePage>
    with TickerProviderStateMixin {
  double padding = 24.0;

  // selected container
  bool checkCash = false;
  bool checkCard = false;

  AnimationController _controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0, end: 1)
        .chain(CurveTween(curve: Curves.fastOutSlowIn))
        .animate(_controller)
          ..addListener(() {
            setState(() {});
          });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 28.0, color: Colors.black),
        ),
        centerTitle: true,
        title: Text(
          "Select Payment Type",
          style: TextStyle(
              fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),

      // body
      body: Container(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: padding,
                    left: animation.value * 282.0 - 200.0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          checkCard ? null : checkCash = !checkCash;
                        });
                      },
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 14.0,
                              left: 14.0,
                              right: 14.0,
                              bottom: 0.0,
                              child: Container(
                                height: 180.0,
                                width: 180.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: checkCash
                                      ? Colors.deepPurpleAccent.withOpacity(0.2)
                                      : Colors.grey[200],
                                  border: checkCash
                                      ? Border.all(
                                          color: Colors.deepPurpleAccent,
                                          width: 1.0)
                                      : null,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("assets/wallet.png",
                                        height: 150.0, fit: BoxFit.fitHeight),
                                    Text(
                                      "Cash",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            checkCash
                                ? Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Icon(Icons.check_circle,
                                        size: 28.0,
                                        color: Colors.deepPurpleAccent),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: padding,
                    right: animation.value * 282.0 - 200.0,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          checkCash ? null : checkCard = !checkCard;
                        });
                      },
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 14.0,
                              left: 14.0,
                              right: 14.0,
                              bottom: 0.0,
                              child: Container(
                                height: 180.0,
                                width: 180.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: checkCard
                                      ? Colors.deepPurpleAccent.withOpacity(0.2)
                                      : Colors.grey[200],
                                  border: checkCard
                                      ? Border.all(
                                          color: Colors.deepPurpleAccent,
                                          width: 1.0)
                                      : null,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("assets/card.png",
                                        height: 150.0, fit: BoxFit.fitHeight),
                                    Text(
                                      "Card",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            checkCard
                                ? Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Icon(Icons.check_circle,
                                        size: 28.0,
                                        color: Colors.deepPurpleAccent),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // bottom
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SelectCardPage()));
              },
              child: Container(
                height: 64.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.deepPurpleAccent),
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
