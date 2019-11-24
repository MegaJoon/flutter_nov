// burger tab item list

class BurgerTabItem {
  String image;
  String text;
  bool isSelected;
  String onSale;

  BurgerTabItem({this.image, this.text, this.isSelected, this.onSale});
}

List<BurgerTabItem> burgerTabItem = [
  BurgerTabItem(
      image: "assets/mcdonald/burger00.png",
      text: "Combo Meal",
      isSelected: false,
      onSale: "30% off"),
  BurgerTabItem(
      image: "assets/mcdonald/burger01.png",
      text: "Burger &\nSandwiches",
      isSelected: false,
      onSale: null),
  BurgerTabItem(
      image: "assets/mcdonald/burger02.png",
      text: "Happy Meal",
      isSelected: false,
      onSale: null),
  BurgerTabItem(
      image: "assets/mcdonald/burger03.png",
      text: "Beverage",
      isSelected: false,
      onSale: null),
  BurgerTabItem(
      image: "assets/mcdonald/burger04.png",
      text: "Chicken",
      isSelected: false,
      onSale: null),
  BurgerTabItem(
      image: "assets/mcdonald/burger05.png",
      text: "Snacks &\nSides",
      isSelected: false,
      onSale: null),
];
