import 'package:flutter/material.dart';
import 'package:flutter_nov/1108/fitnessitem.dart';

// https://dribbble.com/shots/8065787/attachments/536920?mode=media

class FitnessApp extends StatefulWidget {
  @override
  _FitnessAppState createState() => _FitnessAppState();
}

class _FitnessAppState extends State<FitnessApp> {
  // light red color
  Color _color = Color.fromRGBO(255, 99, 71, 1);

  // user profile image
  String _profileImage = "https://cdn.pixabay.com/photo/2019/10/30/17/10/teddy-4590050__340.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // appbar
            _buildAppbar(),

            // popular
            _buildListView(),

            // metadata
            _buildMetaData(),
          ],
        ),
      ),

      // bottomappbar
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: _color,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // pulse now
              Container(
                height: 64.0,
                width: 100.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("98",
                      style: TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold),
                    ),

                    Text("Pulse Now",
                      style: TextStyle(fontSize: 14.0, color: Colors.white70, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),

              // average
              Container(
                height: 64.0,
                width: 100.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("79",
                      style: TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold),
                    ),

                    Text("Average",
                      style: TextStyle(fontSize: 14.0, color: Colors.white70, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // floating btn
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            print("on clicked");
          });
        },
        backgroundColor: _color,
        child: Center(
            child: Icon(Icons.favorite, size: 24.0, color: Colors.white,),
        ),
      ),

      // floating btn location
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // buil appbar
  _buildAppbar(){
    return SafeArea(
      top: true,
      left: true,
      right: true,
      child: Container(
        margin: EdgeInsets.only(right: 24.0),
        height: 64.0,
        child: Row(
          children: <Widget>[
            Icon(Icons.menu, size: 32.0, color: Colors.black,),
            Spacer(),
            Container(
              height: 52.0,
              width: 52.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(_profileImage), fit: BoxFit.fill)),
//              child: Placeholder(),
            ),
          ],
        ),
      ),
    );
  }

  // build main listview (popular)
  _buildListView(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      height: 520.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Popular",
            style: TextStyle(fontSize: 32.0, color: Colors.black, fontWeight: FontWeight.w600),
          ),

          // listview
          Container(
            height: 447.0,
            child: ListView.builder(
              itemCount: fitnessItem.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: 16.0),
                itemBuilder: (BuildContext context, int index){
              return Container(
                margin: EdgeInsets.only(right: 24.0),
                width: 250.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: fitnessItem[index].color,
                  image: DecorationImage(image: AssetImage(fitnessItem[index].image), fit: BoxFit.cover)
                ),
                child: Stack(
                  children: <Widget>[
                    // image
//                    Positioned(
//                      top: 0,
//                      left: 0,
//                      right: 0,
//                      bottom: 0,
//                      child: Container(
//                        decoration: BoxDecoration(
//                          image: DecorationImage(image: AssetImage(fitnessItem[index].image), fit: BoxFit.cover)
//                        ),
//                      ),
//                    ),

                    // column
                    Positioned(
                      top: 24.0,
                      left: 16.0,
                      right: 0,
                      bottom: 16.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // beginner
                          Text(fitnessItem[index].beginner,
                            style: TextStyle(fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.w600),
                          ),

                          SizedBox(
                            height: 16.0,
                          ),

                          // title
                          Text(fitnessItem[index].title,
                            style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold),
                          ),

                          SizedBox(
                            height: 16.0,
                          ),

                          // score container
                          Container(
                            height: 32.0,
                            width: 56.0,
                            decoration: ShapeDecoration(
                              shape: StadiumBorder(),
                              color: _color,
                            ),
                            child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(Icons.star, size: 14.0, color: Colors.white,),
                                    Text(fitnessItem[index].score,
                                      style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                            ),
                          ),

                          Spacer(),

                          // day
                          Text(fitnessItem[index].day,
                            style: TextStyle(fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  // build metadata column
  _buildMetaData(){
    return Container(
      height: 130.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Metadata",
          style: TextStyle(fontSize: 32.0, color: Colors.black, fontWeight: FontWeight.w600),
          ),

          //
          Container(
            margin: EdgeInsets.only(top: 16.0, right: 24.0),
            height: 70.0,
            child: Row(
              children: <Widget>[
                // icon
                Container(
                  margin: EdgeInsets.only(right: 16.0),
                  height: 52.0,
                  width: 52.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: fitnessItem[0].color,
                  ),
                  child: Center(
                      child: Icon(Icons.whatshot, size: 24.0, color: Colors.red, )),
                ),

                // text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("740",
                    style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold),
                    ),

                    Text("Kcal",
                      style: TextStyle(fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),

                Spacer(),

                // icon
                Icon(Icons.more_vert, size: 24.0, color: Colors.black,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
























