class TravelList {
  String image;
  String title;
  String subTitle;
  String description;

  TravelList({this.image, this.title, this.subTitle, this.description});
}

List<TravelList> travelList = [
  TravelList(
    image: "assets/travel_image.png",
    title: "Trips",
    subTitle: "Mountain",
    description: "Mountain hikes give you\nan incredible sense of freedom\nalong with endurance tests",
  ),

  TravelList(
    image: "assets/travel_image1.png",
    title: "Trips1",
    subTitle: "Mountain1",
    description: "1Mountain hikes give you\nan incredible sense of freedom\nalong with endurance tests",
  ),

  TravelList(
    image: "assets/travel_image2.png",
    title: "Trips2",
    subTitle: "Mountain2",
    description: "2Mountain hikes give you\nan incredible sense of freedom\nalong with endurance tests",
  ),
];
