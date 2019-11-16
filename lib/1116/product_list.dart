import 'package:flutter/material.dart';

class ProductList {
  Color color;
  String tag; // Fruits
  String title;
  String image;

  // bottom text
  String market;
  String distance;
  String grams;
  String kcal;

  ProductList(
      {this.color,
      this.tag = "Fruits",
      this.title,
      this.image,
      this.market,
      this.distance,
      this.grams,
      this.kcal});
}

List<ProductList> productList = [
  ProductList(
    color: Color.fromRGBO(2, 27, 184, 1),
    title: "Pomegranate",
    image: "assets/fruit_image.png",
    market: "Lynx Market",
    distance: "10min",
    grams: "100 grams",
    kcal: "437kcal",
  ),
  ProductList(
    color: Color.fromRGBO(233, 165, 0, 1),
    title: "Atom Plate",
    image: "assets/fruit_image2.png",
    market: "Big W Market",
    distance: "15min",
    grams: "240 grams",
    kcal: "850kcal",
  ),
  ProductList(
    color: Color.fromRGBO(213, 79, 63, 1),
    title: "Atom Plate",
    image: "assets/fruit_image3.png",
    market: "Colls Market",
    distance: "25min",
    grams: "150 grams",
    kcal: "676kcal",
  ),
];
