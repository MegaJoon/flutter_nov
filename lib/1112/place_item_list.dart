class PlaceItemList {
  String image;
  String text;
  String address;

  PlaceItemList({this.image, this.text, this.address});
}

List<PlaceItemList> placeItemList = [
  PlaceItemList(
    image:
        "https://cdn.pixabay.com/photo/2017/12/10/17/40/prague-3010407_960_720.jpg",
    text: "Cascade",
    address: "Canada, Banff",
  ),

  PlaceItemList(
    image:
        "https://cdn.pixabay.com/photo/2018/01/21/01/46/architecture-3095716_960_720.jpg",
    text: "Yosemite",
    address: "USA, California",
  ),

  PlaceItemList(
    image:
        "https://cdn.pixabay.com/photo/2019/07/20/20/11/nature-4351455_960_720.jpg",
    text: "Cascade",
    address: "Canada, Banff",
  ),
];
