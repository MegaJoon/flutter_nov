import 'package:flutter/material.dart';

// https://dribbble.com/shots/8231607-Delivery-App

class DeliveryApp extends StatefulWidget {
  @override
  _DeliveryAppState createState() => _DeliveryAppState();
}

class _DeliveryAppState extends State<DeliveryApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // appbar
          _buildAppbar(),

          // tabbar
          _buildTabbar(),

          // main container
          _buildTabbarView(),
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
        height: 64.0,
        child: Placeholder(),
      ),
    );
  }

  _buildTabbar(){
    return Container(
      height: 64.0,
      child: Placeholder(),
    );
  }

  _buildTabbarView(){
    return Flexible(
      fit: FlexFit.tight,
      child: Placeholder(),
    );
  }
}
