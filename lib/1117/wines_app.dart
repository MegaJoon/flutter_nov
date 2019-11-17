import 'package:flutter/material.dart';

// https://dribbble.com/shots/8248877-Winery-Luxury-Wines-App-Design/attachments/605805?mode=media

class WinesApp extends StatefulWidget {
  @override
  _WinesAppState createState() => _WinesAppState();
}

class _WinesAppState extends State<WinesApp> with TickerProviderStateMixin {
  double padding = 24.0;

  Color _color = Color.fromRGBO(215, 194, 113, 1);

  String title = "Winery";
  String subTitle = "The Best Wine Shop in Town";

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          //
          Positioned(
            top: padding,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: <Widget>[
                // appbar
                SafeArea(
                  top: true,
                  left: true,
                  right: true,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: padding),
                    height: 80.0,
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(title, style: TextStyle(fontSize: 32.0, color: Colors.black, fontWeight: FontWeight.w300),),
                            Text(subTitle, style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w300),),
                          ],
                        ),

                        Spacer(),

                        Icon(Icons.search, size: 28.0, color: Colors.black)
                      ],
                    ),
                  ),
                ),

                // tabbar
                Container(
                  margin: EdgeInsets.only(top: padding * 0.5, left: padding, bottom: padding * 0.5),
                  height: 40.0,
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    unselectedLabelColor: Colors.black,
                    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
                    labelColor: Colors.white,
                    labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),

                    indicator: ShapeDecoration(shape: StadiumBorder(), color: _color),
                    indicatorPadding: EdgeInsets.symmetric(horizontal: padding),
                    indicatorSize: TabBarIndicatorSize.tab,

                    labelPadding: EdgeInsets.symmetric(horizontal: padding),

                    tabs: <Widget>[
                      Tab(text: "White"),
                      Tab(text: "Red"),
                      Tab(text: "Rose"),
                      Tab(text: "Dessert"),
                      Tab(text: "Spark"),
                    ],
                  ),
                ),

                Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        // initial page
                        GridView.builder(
                          itemCount: whiteWine.length,
                            padding: EdgeInsets.only(top: padding, left: 2.0, right: 2.0),
                            shrinkWrap: true,
                             scrollDirection: Axis.vertical,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: padding * 0.5,
                              crossAxisSpacing: padding * 0.5,
                              childAspectRatio: 0.5 / 0.7
                            ),
                            itemBuilder: (BuildContext context, int index){
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: Colors.white,
                                  boxShadow: [BoxShadow(
                                    color: Colors.black12.withOpacity(0.1), spreadRadius: 1, blurRadius: 1
                                  )]
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        // image
                                        Container(
                                          margin: EdgeInsets.only(top: 8.0),
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(whiteWine[index].image),
                                              fit: BoxFit.fitHeight
                                            ),
                                          ),
                                        ),

                                        // text
                                        Text(whiteWine[index].text,
                                        style: TextStyle(
                                          fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w400),
                                          textAlign: TextAlign.center,
                                        ),

                                        Text(whiteWine[index].subText,
                                          style: TextStyle(
                                              fontSize: 12.0, color: Colors.black12, fontWeight: FontWeight.w400),
                                        ),

                                        SizedBox(height: 8.0),
                                      ],
                                    ),

                                    // add icon
                                    Positioned(
                                      top: 8.0,
                                      right: 8.0,
                                      child: Icon(Icons.add, size: 24.0, color: _color),
                                    ),
                                  ],
                                ),
                              );
                            }),

                        // dont use
                        Placeholder(),
                        Placeholder(),
                        Placeholder(),
                        Placeholder(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // bottom shadow
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 64.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white.withOpacity(0.5),
                  Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                ),
              ),
//              child: Placeholder(),
            ),
          ),

          // right shadow
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: padding,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white.withOpacity(0.5),
                      Colors.white],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft
                ),
              ),
            ),
          ),
        ],
      ),

      // floatingbtn
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: _color,
        child: Icon(Icons.add_shopping_cart, size: 32.0, color: Colors.white),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class WhiteWine {
  String image;
  String text;
  String subText;

  WhiteWine({this.image, this.text, this.subText});
}

List<WhiteWine> whiteWine = [
  WhiteWine(image: "assets/wine.png", text: "Domaine Ramonet\nMontrachet\nGrand Cru", subText: "Chardonnay"),
  WhiteWine(image: "assets/wine2.png", text: "Domaine\nLeflaive Batard\nMontrachet", subText: "Chardonnay"),
  WhiteWine(image: "assets/wine3.png", text: "Domaine de la\nRomanee-Conti\nMontrachet", subText: "Chardonnay"),
  WhiteWine(image: "assets/wine4.png", text: "Coche-Dury\nCorton-Charlemagne\nGrand Cru", subText: "Chardonnay"),
  //
  WhiteWine(image: "assets/wine.png", text: "Domaine Ramonet\nMontrachet\nGrand Cru", subText: "Chardonnay"),
  WhiteWine(image: "assets/wine2.png", text: "Domaine\nLeflaive Batard\nMontrachet", subText: "Chardonnay"),
  WhiteWine(image: "assets/wine3.png", text: "Domaine de la\nRomanee-Conti\nMontrachet", subText: "Chardonnay"),
  WhiteWine(image: "assets/wine4.png", text: "Coche-Dury\nCorton-Charlemagne\nGrand Cru", subText: "Chardonnay"),
];













