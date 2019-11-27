import 'package:flutter/material.dart';

class StarbucksList {
  Color color;
  String title;
  String subTitle;
  String price;
  String image;

  StarbucksList({this.color, this.title, this.subTitle, this.price, this.image});
}

List<StarbucksList> startbucks = [
  StarbucksList(
    color: Color.fromRGBO(30, 57, 50, 1),
    title: "warm & tasty",
    subTitle: "Holiday Turkey &\nStuffing Sandwich",
    price: "\$8.99",
    image: "assets/starbucks/sandwich.png",
  ),

  StarbucksList(
      color: Color.fromRGBO(197, 40, 54, 1),
    title: "hot & creamy",
    subTitle: "Chestnut Praline\nLatte Festive Flavour",
    price: "\$4.99",
    image: "assets/starbucks/flavour.png",
  ),

  StarbucksList(
      color: Color.fromRGBO(0, 112, 74, 1),
    title: "hot & minty",
    subTitle: "Midnight Mint Mocca\nFrappuchino",
    price: "\$5.99",
    image: "assets/starbucks/frappuchino.png",
  ),
];












