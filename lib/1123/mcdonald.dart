import 'package:flutter/material.dart';
import 'package:flutter_nov/1123/burger_box.dart';

// https://dribbble.com/shots/7049291-McDonald-s-Touch-Interface-Concept/attachments/49835?mode=media

class McDonaldApp extends StatefulWidget {
  @override
  _McDonaldAppState createState() => _McDonaldAppState();
}

class _McDonaldAppState extends State<McDonaldApp> {
  List<int> _data = new List();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  Color _color = Color.fromRGBO(255, 203, 63, 1);

  double padding = 16.0;

  String _totalPrice = "\$13.86";

  void _onPressed(int index) {
    setState(() {
      burgerList[index].isSelected = !burgerList[index].isSelected;
      burgerList[index].isSelected ? _addItem(index) : _removeItem(index);
    });
  }

  void _addItem(int index) {
    setState(() {
    _data.insert(0, index);
    _listKey.currentState.insertItem(0, duration: Duration(milliseconds: 200));
    });
  }

  void _removeItem(int index) {
    setState(() {
//      _listKey.currentState.removeItem(0,
//        (context, animation) => _buildItem(context, 0, animation),
//        duration: Duration(milliseconds: 200),
//      );
//      _data.removeAt(index);

      _listKey.currentState.removeItem(
        index, (context, animation) => _buildItem(context, 0, animation),
        duration: Duration(milliseconds: 200),
      );
      _data.removeAt(0);
    });
  }

  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return SizeTransition(
      key: ValueKey<int>(index),
      axis: Axis.vertical,
      sizeFactor: animation,
      child: SizedBox(
        child: Center(
          child: Text(
            _data[index].toString(),
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Row(
          children: <Widget>[
            // left box
            Flexible(
              fit: FlexFit.tight,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Column(
                    children: <Widget>[
                      // appbar
                      Container(
                        padding: EdgeInsets.symmetric(vertical: padding * 1.5),
                        margin: EdgeInsets.only(bottom: padding),
                        alignment: Alignment.centerLeft,
                        height: 80.0,
                        child: Image.asset("assets/mcdonald_icon.PNG",
                            fit: BoxFit.contain),
                      ),

                      // title
                      Container(
                        margin: EdgeInsets.only(bottom: padding),
                        alignment: Alignment.centerLeft,
                        height: 80.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Hey,",
                              style: TextStyle(
                                  fontSize: 24.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "what's up?",
                              style: TextStyle(
                                  fontSize: 24.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),

                      // first box
                      Container(
                        margin: EdgeInsets.only(bottom: padding),
                        height: 400.0,
                        child: GridView.builder(
                            itemCount: 6,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16.0,
                              mainAxisSpacing: 16.0,
                              childAspectRatio: 1.0,
                            ),
                            itemBuilder: (context, index) {
                              return BurgerBox(
                                image: burgerList[index].image,
                                text: burgerList[index].text,
                                onSale: burgerList[index].onSale,
                                isSelected: burgerList[index].isSelected,
                                onPressed: () {
                                  _onPressed(index);
                                },
                              );
                            }),
                      ),

                      // popular : second box
                      Placeholder(),
                    ],
                  ),
                ),
              ),
            ),

            // right box
            Container(
              width: 120.0,
              color: Colors.grey[100],
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Column(
                  children: <Widget>[
                    // appbar
                    Container(
                      padding: EdgeInsets.symmetric(vertical: padding * 1.2),
                      margin: EdgeInsets.only(bottom: padding),
                      alignment: Alignment.centerRight,
                      height: 64.0,
                      child: Container(
                        width: 24.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://cdn.pixabay.com/photo/2016/01/19/17/47/usa-1149896__340.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),

                    // title
                    Container(
                      margin: EdgeInsets.only(bottom: padding),
                      alignment: Alignment.centerLeft,
                      height: 80.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "My\nOrder",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Take Out",
                            style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),

                    // selectedItemlist
                    Flexible(
                      fit: FlexFit.tight,
                      child: AnimatedList(
                          key: _listKey,
//                        initialItemCount: _data.length,
                          itemBuilder: (context, index, animation) {
                            return _buildItem(context, index, animation);
                          }),
                    ),

                    // total price & done
                    Container(
                      height: 180.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Total",
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      height: 2.0),
                                ),
                                Text(
                                  _totalPrice,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: _color,
                              ),
                              child: Center(
                                child: Text(
                                  "Done",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BurgerList {
  String image;
  String text;
  bool isSelected;
  String onSale;

  BurgerList({this.image, this.text, this.isSelected, this.onSale});
}

List<BurgerList> burgerList = [
  BurgerList(
      image: "assets/burger1.png",
      text: "Combo Meat",
      isSelected: false,
      onSale: "30% off"),
  BurgerList(
      image: "assets/burger2.png",
      text: "Burger &\nSandwiches",
      isSelected: false,
      onSale: null),
  BurgerList(
      image: "assets/burger3.png",
      text: "Happy Meal",
      isSelected: false,
      onSale: null),
  //
  BurgerList(
      image: "assets/burger1.png",
      text: "Combo Meat",
      isSelected: false,
      onSale: "30% off"),
  BurgerList(
      image: "assets/burger2.png",
      text: "Burger &\nSandwiches",
      isSelected: false,
      onSale: null),
  BurgerList(
      image: "assets/burger3.png",
      text: "Happy Meal",
      isSelected: false,
      onSale: null),
];
