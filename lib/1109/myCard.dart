import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_nov/1109/card_item_list.dart';

class MyCard extends StatelessWidget {
  final double index;

  MyCard(this.index);

  @override
  Widget build(BuildContext context) {
    double ratio = 1.2 / 1.9;  // box ratio

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        List<Widget> cardList = new List();

        double screenWidth = constraints.maxWidth;  // device width
        double screenHeight = constraints.maxHeight;  // device height

        double boxWidth = screenWidth - 32.0;  // box width
        double boxHeight = screenHeight - 32.0;  // box height

        // widget == container(contained card widget)
        double widgetHeight = boxHeight;  // same as box height
        double widgetWidth = widgetHeight * ratio;

        double marginWidget = boxWidth - widgetWidth;

        for(int i = 0; i < cardItemList.length; i++){
          // page[index] = first page
          // i = count, behind first page
          double diff = i - index;
          // when page changed, padding
          double positionedRightWidget = 16.0 + max(marginWidget + diff * (diff > 0? 400 : 16), 0.0);
          // top bottom margin;
          double positionedMargin = 16.0 * (1 - diff);

          var cardItem = Positioned(
            top: positionedMargin,
            bottom: positionedMargin,
            right: positionedRightWidget,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(image: NetworkImage(cardItemList[i].image), fit: BoxFit.fill),
              ),
              child: AspectRatio(
              aspectRatio: ratio,
              child: Placeholder()),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList
        );
      },
    );
  }
}
