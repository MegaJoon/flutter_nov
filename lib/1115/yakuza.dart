import 'package:flutter/material.dart';
import 'package:flutter_nov/1115/second_yakuza.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// https://dribbble.com/shots/8207985-Mobile-app-Yakuza/attachments/585375?mode=media

class YakuzaApp extends StatefulWidget {
  @override
  _YakuzaAppState createState() => _YakuzaAppState();
}

class _YakuzaAppState extends State<YakuzaApp> {
  // title
  String title = "Yakuza";
  String subTitle = "Enjoy every moment";

  // text in container
  String textInContainer = "Live in pleasure";
  String btnText = "Go to shop";
  
  Color _color = Color.fromRGBO(70, 40, 66, 1);

  String _image = "assets/yakuza.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // appbar
          _buildAppbar(),

          // title
          _buildTitle(),

          // cotainer
          _buildContainer(),

          // bottombar
          _buildBottombar(),
        ],
      ),
    );
  }

  _buildAppbar(){
    return SafeArea(
      top: true,
      left: true,
      right: true,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        height: 32.0,
        alignment: Alignment.centerRight,
        child: Icon(Icons.more_vert, size: 28.0, color: Colors.black),
      ),
    );
  }

  _buildTitle(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      height: 100.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(title,
          style: TextStyle(
            fontSize: 40.0,
            color: Colors.black,
            fontWeight: FontWeight.bold),
          ),

          Text(subTitle,
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  _buildContainer(){
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: _color,
        ),
        child: Stack(
          children: <Widget>[
            // text
            Positioned(
              top: 32.0,
              left: 24.0,
              child: Text(textInContainer,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),

            // image
            Positioned(
              top: 50.0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(_image, fit: BoxFit.fill),
            ),
          ],
        ),
      ),
    );
  }

  _buildBottombar(){
    return Container(
      height: 150.0,
      child: Stack(
        children: <Widget>[
          // move page
          // orange container
          Positioned(
            top: 60.0,
            left: 0,
            right: 0,
            bottom: 0,
            child: InkWell(
              onTap: (){
                setState(() {
                  // move page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SecondYakuza()));
                });
              },
              child: Container(
                color: Colors.deepOrange,
                child: Center(
                    child: Text(btnText,
                    style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                ),
              ),
            ),
          ),

          // floatingbtn
          Positioned(
            top: 0,
            left: MediaQuery.of(context).size.width / 2 - 50.0,
            right: MediaQuery.of(context).size.width / 2 - 50.0,
            bottom: 150.0 - 80.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                  color: Colors.grey[200],
                boxShadow: [BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 1
                )]
              ),
              child: Center(
                  child: Icon(FontAwesomeIcons.exchangeAlt, size: 20.0, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


















