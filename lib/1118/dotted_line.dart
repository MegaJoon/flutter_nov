import 'package:flutter/material.dart';

class Dottedline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWeight = constraints.constrainWidth();
        final lineHeight = 2.0;
        final lineWidth = 4.0;
        final lineCount = (boxWeight / (lineHeight *4)).floor();

        return Flex(
          direction: Axis.horizontal,
          children: List.generate(lineCount, (_){
            return Row(
              children: <Widget>[
                SizedBox(
                  height: lineHeight,
                  width: lineWidth,
                  child: DecoratedBox(decoration: ShapeDecoration(shape: StadiumBorder(), color: Colors.grey[300])),
                ),
                SizedBox(
                  height: lineHeight,
                  width: lineWidth,
                ),
              ],
            );
          }),
        );
      },
    );
  }
}