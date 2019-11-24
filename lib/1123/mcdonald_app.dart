import 'package:flutter/material.dart';
import 'package:flutter_nov/1123/burger_item_box.dart';
import 'package:flutter_nov/1123/burger_item_list.dart';
import 'package:flutter_nov/1123/burger_tab.dart';
import 'package:flutter_nov/1123/burger_tab_item.dart';

class McDonaldApp extends StatefulWidget {
  @override
  _McDonaldAppState createState() => _McDonaldAppState();
}

class _McDonaldAppState extends State<McDonaldApp> {
  List<Widget> pages;
  List<SelectedItem> _data = new List();

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  // value
  double padding = 16.0;
  int _currentIndex = 0; // tab index

  int cnt = 1;
  int _totalPrice = 0;

  // Color list
  Color _greyColor = Colors.grey[100];
  Color _color = Color.fromRGBO(255, 203, 63, 1); // like amber color

  // image.asset
  String _iconImage = "assets/mcdonald/icon.PNG"; // 'M' icon

  // tabbar : onClicked
  void _onPressed(int currentIndex) {
    setState(() {
      _currentIndex = currentIndex;
    });
  }

  // onClick event
  void _onTapItem(int index) {
    setState(() {
      print("index = $index");
      burgerItemList[index].isSelected = !burgerItemList[index].isSelected;
      burgerItemList[index].isSelected ? _addItem(index) : _removeItem(index);
    });
  }

  // add item
  void _addItem(int index) {
    setState(() {
      _data.insert(0, SelectedItem(index: index, cnt: 1));
      _listKey.currentState.insertItem(0, duration: Duration(milliseconds: 200));

      // + totalprice
      _totalPrice += burgerItemList[index].price;
    });
//    print("index = $index");
  }

  // remove item
  void _removeItem(int index) {
    setState(() {
//      print("index = $index");
      int num = _data.indexWhere((SelectedItem _data) => _data.index == index);
//      print("num = $num");

      // - totalprice
      _totalPrice -= burgerItemList[index].price * _data[num].cnt;

      _listKey.currentState.removeItem(
        num,
        (context, animation) => _buildItem(context, 0, animation),
        duration: Duration(milliseconds: 200),
      );
      _data.removeAt(num);
    });
  }

  Widget _buildItem(BuildContext context, int index, Animation<double> animation) {
    return SizeTransition(
      key: ValueKey<int>(index),
      axis: Axis.vertical,
      sizeFactor: animation,
      child: SizedBox(
        child: Center(
          child: _data.length > 0
              ? Container(
                  height: 120.0,
                  width: 120.0 - padding * 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // image
                      Image.asset(
                        burgerItemList[_data[index].index].image,
                        width: 40.0,
                        fit: BoxFit.fitWidth,
                      ),

                      // text
                      Text(
                        burgerItemList[_data[index].index].text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      // price
                      Text(
                        burgerItemList[_data[index].index].price.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),

                      // cnt
                      Container(
                        height: 24.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            // -
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _data[index].cnt == 1 ? null : _data[index].cnt--;
                                  _totalPrice -= burgerItemList[_data[index].index].price;
                                });
                              },
                              child: Container(
                                height: 16.0,
                                width: 28.0,
                                decoration: ShapeDecoration(
                                  shape: StadiumBorder(side: BorderSide(color: Colors.grey, width: 1.0)),
                                ),
                                child: Center(
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // text : cnt
                            Text(
                              _data[index].cnt.toString(),
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // +
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _data[index].cnt++;
                                  _totalPrice += burgerItemList[_data[index].index].price;
                                });
                              },
                              child: Container(
                                height: 16.0,
                                width: 28.0,
                                decoration: ShapeDecoration(
                                  shape: StadiumBorder(),
                                  color: _color,
                                ),
                                child: Center(
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _definePage();

    return Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Row(
          children: <Widget>[
            // left part
            Flexible(
              fit: FlexFit.tight,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // appbar
                      Container(
                        margin: EdgeInsets.only(bottom: padding),
                        alignment: Alignment.centerLeft,
                        height: 32.0,
                        child: Image.asset(_iconImage, fit: BoxFit.contain),
                      ),

                      // title
                      Container(
                        margin: EdgeInsets.only(bottom: padding),
                        alignment: Alignment.centerLeft,
                        height: 48.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Hey,",
                              style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "what's up?",
                              style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),

                      // tabbar
                      Container(
                        margin: EdgeInsets.only(bottom: padding * 2),
                        height: 400.0,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: burgerTabItem.length,
                          // 6
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: padding,
                            mainAxisSpacing: padding,
                            childAspectRatio: 1.0,
                          ),
                          itemBuilder: (context, index) {
                            return BurgerTab(
                              image: burgerTabItem[index].image,
                              text: burgerTabItem[index].text,
                              onSale: burgerTabItem[index].onSale,
                              isSelected: _currentIndex == index,
                              onPressed: () {
                                _onPressed(index);
                              },
                            );
                          },
                        ),
                      ),

                      // tabbar view
                      Container(
                        height: 1000.0,
                        child: pages[_currentIndex],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // right part
            Container(
              width: 120.0,
              color: _greyColor,
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  children: <Widget>[
                    // appbar
                    Container(
                      margin: EdgeInsets.only(bottom: padding),
                      alignment: Alignment.centerRight,
                      height: 32.0,
                      child: Container(
                        width: 32.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage("https://cdn.pixabay.com/photo/2016/01/19/17/47/usa-1149896__340.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),

                    // title
                    Container(
                      margin: EdgeInsets.only(bottom: padding *0.5),
                      alignment: Alignment.centerLeft,
                      height: 48.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "My\nOrder",
                            style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            "Take Out",
                            style: TextStyle(fontSize: 10.0, color: Colors.grey, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),

                    // divider
                    Divider(height: 2.0, color: Colors.grey),

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

                    // divider
                    Divider(height: 2.0, color: Colors.grey),

                    // total price & done
                    Container(
                      height: 150.0,
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
                                  style: TextStyle(fontSize: 10.0, color: Colors.grey, fontWeight: FontWeight.w600, height: 2.0),
                                ),
                                Text(
                                  _totalPrice.toString(),
                                  style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
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
                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),
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

  _definePage() {
    pages = [
      // initial page
      // popular burger item
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Popular",
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          // burger item
          Container(
            margin: EdgeInsets.only(bottom: padding * 3),
            height: 400.0,
            child: GridView.builder(
                padding: EdgeInsets.only(top: padding),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return BurgerItemBox(
                    image: burgerItemList[index].image,
                    text: burgerItemList[index].text,
                    price: burgerItemList[index].price.toString(),
                    isSelected: burgerItemList[index].isSelected,
                    onPressed: () {
                      _onTapItem(index);
                    },
                  );
                }),
          ),

          // placeholder
          Container(
            height: 400.0,
            child: Placeholder(),
          ),
        ],
      ),

      // dessert item
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Popular",
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          // dessert item
          Container(
            margin: EdgeInsets.only(bottom: padding * 3),
            height: 400.0,
            child: GridView.builder(
                padding: EdgeInsets.only(top: padding),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return BurgerItemBox(
                    image: burgerItemList[index + 9].image,
                    text: burgerItemList[index + 9].text,
                    price: burgerItemList[index + 9].price.toString(),
                    isSelected: burgerItemList[index + 9].isSelected,
                    onPressed: () {
                      _onTapItem(index + 9);
                    },
                  );
                }),
          ),

          // placeholder
          Container(
            height: 400.0,
            child: Placeholder(),
          ),
        ],
      ),

      // dont use
      Placeholder(color: Colors.amber),
      Placeholder(color: Colors.green),
      Placeholder(color: Colors.indigo),
      Placeholder(color: Colors.pink),
    ];
  }
}

class SelectedItem {
  int index;
  int cnt;

  SelectedItem({this.index, this.cnt});
}
