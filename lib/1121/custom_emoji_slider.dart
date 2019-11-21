import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nov/1121/custom_message_box.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomEmojiSliders extends StatefulWidget {
  @override
  _CustomEmojiSlidersState createState() => _CustomEmojiSlidersState();
}

class _CustomEmojiSlidersState extends State<CustomEmojiSliders> {
  Color _backgroundColor = Color.fromRGBO(68, 53, 255, 1).withOpacity(0.8);
  Color _textColor = Color.fromRGBO(94, 124, 235, 1);

  double padding = 24.0;

  String _profileImage =
      "https://cdn.pixabay.com/photo/2019/11/06/05/15/forest-4605204__340.jpg";
  String _userNameText = "Ryan Williams";

  double positionY = 0.0;

  double extraHeight;

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    extraHeight = MediaQuery.of(context).size.height - 450.0;

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // appbar
              SafeArea(
                top: true,
                left: true,
                right: true,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  height: 52.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: Container(
                          height: 52.0,
                          width: 52.0,
                          color: _textColor,
                          child: Center(
                            child: Icon(
                              Icons.call,
                              size: 28.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: Container(
                          height: 52.0,
                          width: 52.0,
                          color: _textColor,
                          child: Center(
                            child: Icon(
                              Icons.videocam,
                              size: 28.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: Container(
                          height: 52.0,
                          width: 52.0,
                          color: _textColor,
                          child: Center(
                            child: Icon(
                              Icons.folder,
                              size: 28.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: padding),

              // profile image
              ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: Container(
                  height: 64.0,
                  width: 64.0,
                  child: Image.network(_profileImage, fit: BoxFit.fill),
                ),
              ),

              SizedBox(height: padding),

              Text(
                _userNameText,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),

              // spacer
              Spacer(),

              // hidden emoji container
              Container(
                padding: EdgeInsets.all(padding * 0.50),
                height: extraHeight + padding,
                color: Colors.grey,
                child: Stack(
                  children: <Widget>[
                    // pageview
                    Positioned(
                      top: -10.0,
                      left: 0,
                      right: 0,
                      bottom: padding,
                      child: PageView.builder(
                          itemCount: EmojiList.length ~/ 18, // 3
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (int currentPage) {
                            setState(() {
                              _currentPage = currentPage;
                            });
                          },
                          itemBuilder: (context, index) {
                            return GridView.builder(
                                itemCount: 18,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 6,
                                  mainAxisSpacing: 0.0,
                                  crossAxisSpacing: 0.0,
                                ),
                                itemBuilder: (context, idx) {
                                  int num = idx + 18 * index;
                                  return Center(
                                    child: Text(
                                      EmojiList[num],
                                      style: TextStyle(
                                        fontSize: 24.0,
                                      ),
                                    ),
                                  );
                                });
                          }),
                    ),

                    // dot indicator
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.50 - 120.0,
                      right: MediaQuery.of(context).size.width * 0.50 - 120.0,
                      bottom: 0,
                      child: Container(
                        alignment: Alignment.center,
                        height: 32.0,
//                        width: 240.0,
                        child: DotsIndicator(
                          dotsCount: EmojiList.length ~/ 18,
                          axis: Axis.horizontal,
                          position: _currentPage.toDouble(),
                          decorator: DotsDecorator(
                            color: _backgroundColor,
                            activeColor: _textColor,
                            size: Size(6.0, 6.0),
                            activeSize: Size(18.0, 18.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // chatting container
          Positioned(
            left: 0,
            right: 0,
            bottom: positionY,
            child: GestureDetector(
              onVerticalDragStart: (DragStartDetails dragDetails) {},
              onVerticalDragUpdate: (DragUpdateDetails dragDetails) {
                setState(() {
                  positionY += -dragDetails.delta.dy;
                  print("positionY = $positionY");
                });
              },
              onVerticalDragEnd: (DragEndDetails dragDetails) {
                setState(() {
                  if (positionY > 150.0)
                    positionY = extraHeight;
                  else
                    positionY = 0;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: padding * 0.50, horizontal: padding),
                height: 450.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                      bottomLeft: positionY == 0.0
                          ? Radius.circular(0)
                          : Radius.circular(24.0),
                      bottomRight: positionY == 0.0
                          ? Radius.circular(0)
                          : Radius.circular(24.0),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 1,
                      )
                    ]),
                child: Column(
                  children: <Widget>[
                    // appbar
                    positionY == extraHeight
                        ? Container(
                            margin: EdgeInsets.only(bottom: padding * 0.50),
//                      height: 0.0,
                            height: 40.0,
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    size: 28.0,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {},
                                ),
                                Spacer(),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(60.0),
                                  child: Container(
                                    height: 40.0,
                                    width: 40.0,
                                    child: Image.network(_profileImage,
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Spacer(),
                                SizedBox(width: 48.0),
                              ],
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(bottom: padding * 0.50),
                            height: 6.0,
                            width: 48.0,
                            decoration: ShapeDecoration(
                              shape: StadiumBorder(),
                              color: Colors.black12,
                            ),
                          ),

                    // chatting timeline
                    CustomMessageBox(
                        isSend: true,
                        content: "Ok, see you then",
                        time: "5:00 AM"),
                    CustomMessageBox(
                        isSend: false,
                        content: "Hi, Ryan. How's your day going?",
                        time: "5:00 PM"),
                    CustomMessageBox(
                        isSend: true,
                        content: "Great! I'm planning flowers.",
                        time: "7:00 PM"),
                    CustomMessageBox(
                        isSend: false,
                        content: "Great! What kinds r u planning?",
                        time: "8:00 PM"),

                    Spacer(),

                    // bottom input text field
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      height: 48.0,
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(),
                        color: Colors.black12,
                      ),
                      child: Row(
                        children: <Widget>[
                          // prefix icon
                          Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(60.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                  )
                                ]),
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.smile,
                                size: 20.0,
                                color: Colors.black12,
                              ),
                            ),
                          ),

                          // input text field
                          Flexible(
                            fit: FlexFit.tight,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(14.0),
                                border: InputBorder.none,
                                hintText: "Type here..",
                                hintStyle: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                                suffixIcon: Icon(
                                  Icons.mic,
                                  size: 28.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),

                          // suffix icon
                          Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                color: _textColor,
                                borderRadius: BorderRadius.circular(60.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                  )
                                ]),
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.paperPlane,
                                size: 20.0,
                                color: Colors.white,
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
          )
        ],
      ),
    );
  }
}

List<String> EmojiList = [
  // 6 x 3 = 1 set;
  // 1 set
  "😀", "😬", "😁", "😂", "😃", "😄",
  "🤣", "😅", "😇", "😉", "🙂", "😋",
  "😘", "🤯", "🤢", "😱", "😈", "😼",

  // 2 set
  "🐶", "🐱", "🐭", "🐹", "🐰", "🐻",
  "🐼", "🐨", "🐯", "🦁", "🐷", "🐸",
  "🐜", "🐵", "🐳", "🐗", "🐠", "🍄",

  // 3 set
  "🍏", "🍎", "🍐", "🍊", "🍋", "🍌",
  "🍉", "🍇", "🍓", "🍈", "🍒", "🍑",
  "🍍", "🥥", "🥝", "🍅", "🥑", "🍆",

  // one more
  // 1 set
  "😀", "😬", "😁", "😂", "😃", "😄",
  "🤣", "😅", "😇", "😉", "🙂", "😋",
  "😘", "🤯", "🤢", "😱", "😈", "😼",

  // 2 set
  "🐶", "🐱", "🐭", "🐹", "🐰", "🐻",
  "🐼", "🐨", "🐯", "🦁", "🐷", "🐸",
  "🐜", "🐵", "🐳", "🐗", "🐠", "🍄",
];
