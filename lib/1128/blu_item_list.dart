import 'package:google_maps_flutter/google_maps_flutter.dart';

class BluList {
  LatLng latLng;
  String profileImage;
  String background;
  String name;
  String text;
  bool tag1; // icon 1
  bool tag2; // icon 2
  bool tag3; // icon 3

  BluList({this.latLng, this.profileImage, this.background, this.name, this.text, this.tag1, this.tag2, this.tag3});
}

List<BluList> bluList = [
  BluList(
    latLng: LatLng(37.500, 126.950),
    profileImage: "assets/blu/blu.jpg",
    background : "assets/blu/blu_back.jpg",
    name: "Ivetka Style",
    text: "Tag 1",
    tag1: true,
    tag2: true,
    tag3: true,
  ),

  BluList(
    latLng: LatLng(37.510, 126.960),
    profileImage: "assets/blu/blu1.jpg",
    background : "assets/blu/blu_back1.jpg",
    name: "Beaute",
    text: "Tag 2",
    tag1: true,
    tag2: true,
    tag3: false,
  ),

  BluList(
    latLng: LatLng(37.510, 126.950),
    profileImage: "assets/blu/blu2.jpg",
    background : "assets/blu/blu_back2.jpg",
    name: "Visual Studio",
    text: "Tag 3",
    tag1: true,
    tag2: true,
    tag3: true,
  ),

  // center
  BluList(
    latLng: LatLng(37.50573803291112, 126.9531999345871),
    profileImage: null,
    background: null,
    name: "Center",
    text: "Center",
    tag1: true,
    tag2: true,
    tag3: true,
  ),
];
