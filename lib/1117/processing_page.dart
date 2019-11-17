import 'package:flutter/material.dart';
import 'package:flutter_nov/1117/payment_done_page.dart';

class ProcessingPage extends StatefulWidget {
  final int index;

  ProcessingPage(this.index);

  @override
  _ProcessingPageState createState() => _ProcessingPageState();
}

class _ProcessingPageState extends State<ProcessingPage>
    with TickerProviderStateMixin {
  double padding = 24.0;

  List<Color> color = [
    Colors.blueAccent,
    Colors.deepPurpleAccent,
    Colors.amber,
    Colors.indigo
  ];

  AnimationController _controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);
    animation = Tween<double>(begin: 0, end: 1)
        .chain(CurveTween(curve: Curves.fastOutSlowIn))
        .animate(_controller)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentDonePage()));
            }
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
        centerTitle: true,
        title: Text(
          "Payment Processing",
          style: TextStyle(
              fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),

      // body
      body: Stack(
        children: <Widget>[
          // background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              "assets/pattern.jpg",
              fit: BoxFit.fill,
              colorBlendMode: BlendMode.dstATop,
              color: Colors.black12.withOpacity(0.1),
            ),
          ),

          // bottom. card
          Positioned(
            top: MediaQuery.of(context).size.height -
                190.0 -
                (animation.value * 230.0),
            left: MediaQuery.of(context).size.width * 0.50 - 80.0,
            right: MediaQuery.of(context).size.width * 0.50 - 80.0,
            bottom: animation.value * 230.0,
            child: Hero(
              tag: "card ${widget.index}",
              child: Transform.rotate(
                angle: 1.56,
                child: Container(
                  padding: EdgeInsets.all(padding * 0.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(colors: [
                      color[widget.index].withOpacity(0.8),
                      color[widget.index].withOpacity(0.5),
                      color[widget.index],
                      color[widget.index],
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "VISA".toUpperCase(),
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      Image.asset("assets/sim_card.png",
                          height: 24.0, fit: BoxFit.fitHeight),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "2671",
                            style: TextStyle(
                                fontSize: 8.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "9860",
                            style: TextStyle(
                                fontSize: 8.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "8300",
                            style: TextStyle(
                                fontSize: 8.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "0202",
                            style: TextStyle(
                                fontSize: 8.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "11/19",
                          style: TextStyle(
                              fontSize: 8.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        "Sketch app sources".toUpperCase(),
                        style: TextStyle(
                            fontSize: 8.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // bill
          Positioned(
            top: 300.0 - animation.value * 250.0,
            left: MediaQuery.of(context).size.width * 0.50 - 120.0,
            right: MediaQuery.of(context).size.width * 0.50 - 120.0,
            child: Image.asset("assets/bill.png", fit: BoxFit.contain),
          ),

          // pos image
          Positioned(
            top: 250.0,
            left: MediaQuery.of(context).size.width * 0.50 - 300.0,
            right: MediaQuery.of(context).size.width * 0.50 - 300.0,
            child: Container(
              height: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/pos.png"), fit: BoxFit.fitWidth),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
