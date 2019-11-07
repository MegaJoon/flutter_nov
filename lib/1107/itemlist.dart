class ItemList {
  String image;
  String name;
  bool isSelected;

  ItemList({this.image, this.name, this.isSelected});
}

List<ItemList> itemList = [
  ItemList(image: "https://cdn.pixabay.com/photo/2019/11/03/01/56/landscape-4597742__340.jpg", name: "Your story", isSelected: true),
  ItemList(image: "https://cdn.pixabay.com/photo/2019/08/28/14/24/horn-4436913__340.jpg", name: "Velo.sid", isSelected: false),
  ItemList(image: "https://cdn.pixabay.com/photo/2019/11/03/08/35/road-4598095__340.jpg", name: "chris.a", isSelected: false),
  ItemList(image: "https://cdn.pixabay.com/photo/2019/11/04/01/11/cellular-4599956__340.jpg", name: "de.skcnslk", isSelected: true),
  ItemList(image: "https://cdn.pixabay.com/photo/2019/11/05/20/36/abu-dhabi-4604499__340.jpg", name: "dc.dzcds", isSelected: true),
];
