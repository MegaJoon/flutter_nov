import 'package:flutter/material.dart';

class FitnessItem {
  Color color;
  String image;
  String beginner;
  String title;
  String score;
  String day;
  
  FitnessItem({this.color, this.image, this.beginner, this.title, this.score, this.day});
}

List<FitnessItem> fitnessItem = [
  FitnessItem(color: Color.fromRGBO(255, 241, 224, 1), image: "assets/fitness0.png",
    beginner: "Beginner", title: "Slender\nLegs", score: "9.6", day: "5 Days",),
  FitnessItem(color: Color.fromRGBO(198, 229, 252, 1), image: "assets/fitness1.png",
    beginner: "Expert", title: "Body\nsculpt", score: "8.7", day: "8 Days",),
  //
  FitnessItem(color: Color.fromRGBO(255, 241, 224, 1), image: "assets/fitness0.png",
    beginner: "Beginner", title: "Slender\nLegs", score: "9.6", day: "5 Days",),
  FitnessItem(color: Color.fromRGBO(198, 229, 252, 1), image: "assets/fitness1.png",
    beginner: "Expert", title: "Body\nsculpt", score: "8.7", day: "8 Days",),
];