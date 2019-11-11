class WaffleItem {
  String image;
  String title;
  String subTitle;

  WaffleItem({this.image, this.title, this.subTitle});
}

List<WaffleItem> waffleItem = [
  WaffleItem(image: "assets/waffle_image.png", title: "Honey Butter", subTitle: "Rs. 300",),
  WaffleItem(image: "assets/waffle_image1.png", title: "Maple Butter", subTitle: "Rs. 300",),
];