import 'package:flutter/material.dart';

class ControlScroll extends StatefulWidget {
  @override
  _ControlScrollState createState() => _ControlScrollState();
}

class _ControlScrollState extends State<ControlScroll> {
  List<Color> colorList = [
    Colors.black,
    Colors.deepPurple,
    Colors.red,
    Colors.amber,
    Colors.teal
  ];

  ValueNotifier<double> _notifier;

  ScrollController _scrollController;

  PageController pageController;

  void _onScroll() {
    _notifier.value = pageController.page;
    print("notifier.value = ${_notifier.value}");
    onChanged(_notifier.value * MediaQuery.of(context).size.width);
  }

  void onChanged(double position){
    setState(() {
      _scrollController.animateTo(
          position,
          duration: Duration(microseconds: 500),
          curve: Curves.fastOutSlowIn);
    });
  }

  @override
  void initState() {
    _notifier = ValueNotifier<double>(0);

    pageController = PageController(initialPage: 2)
    ..addListener(_onScroll);

    _scrollController = ScrollController(initialScrollOffset: 820.0);
    super.initState();
  }

  @override
  void dispose() {
    _notifier?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: colorList.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                controller: _scrollController,
                itemBuilder: (context, index){
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    color: colorList[index],
                    child: Center(
                      child: Text(index.toString(),
                        style: TextStyle(
                            fontSize: 150.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  );
                }),
          ),

          SizedBox(
            height: 48.0,
          ),

          Flexible(
            child: PageView.builder(
                itemCount: colorList.length,
                scrollDirection: Axis.horizontal,
                controller: pageController,
                reverse: true,
                itemBuilder: (context, index){
                  return Container(
                    color: colorList[index],
                    child: Center(
                      child: Text(index.toString(),
                        style: TextStyle(
                            fontSize: 150.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
