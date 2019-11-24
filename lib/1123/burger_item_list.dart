// burger item list

class BurgerItemList {
  String image;
  String text;
  int price;
  bool isSelected;

  BurgerItemList({this.image, this.text, this.price, this.isSelected});
}

List<BurgerItemList> burgerItemList = [
  // 0 ~ 8 : burger list
  BurgerItemList(image: "assets/mcdonald/burger10.png", text : "Big Mac", price : 37, isSelected: false),
  BurgerItemList(image: "assets/mcdonald/burger11.png", text : "Quarter Pounder", price : 36, isSelected: false),
  BurgerItemList(image: "assets/mcdonald/burger12.png", text : "Double Quarter", price : 38, isSelected: false),
  BurgerItemList(image: "assets/mcdonald/burger13.png", text : "Cheese Deluxe", price : 40, isSelected: false),
  BurgerItemList(image: "assets/mcdonald/burger14.png", text : "Cheese Bacon", price : 41, isSelected: false),
  BurgerItemList(image: "assets/mcdonald/burger15.png", text : "Double Cheese1", price : 42, isSelected: false),
  BurgerItemList(image: "assets/mcdonald/burger16.png", text : "Double Cheese2", price : 35, isSelected: false),
  BurgerItemList(image: "assets/mcdonald/burger17.png", text : "Double Cheese3", price : 34, isSelected: false),
  BurgerItemList(image: "assets/mcdonald/burger18.png", text : "Double Cheese4", price : 33, isSelected: false),


  // 9 ~ 17 : dessert list
  BurgerItemList(image: "assets/mcdonald/desserts20.png", text : "McFlurry", price : 10, isSelected: false),
  BurgerItemList(image: "assets/mcdonald/desserts21.png", text : "Chocolate", price : 11, isSelected: false),
  BurgerItemList(image: "assets/mcdonald/desserts22.png", text : "Vanilla Shake", price : 12, isSelected: false),
  BurgerItemList(image: "assets/mcdonald/desserts23.png", text : "Strawberry Shake", price : 13, isSelected: false),
  BurgerItemList(image: "assets/mcdonald/desserts24.png", text : "Vanilla Cone", price : 10, isSelected: false),
  BurgerItemList(image: "assets/mcdonald/desserts25.png", text : "Hot Fudge", price : 11, isSelected: false),
  BurgerItemList(image: "assets/mcdonald/desserts26.png", text : "McFlurry", price : 12, isSelected: false),
  BurgerItemList(image: "assets/mcdonald/desserts27.png", text : "Kiddie Cone", price : 13, isSelected: false),
  BurgerItemList(image: "assets/mcdonald/desserts28.png", text : "Hot Caramel", price : 9, isSelected: false),
];