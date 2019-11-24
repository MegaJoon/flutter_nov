import 'package:flutter/material.dart';

class BurgerItemBox extends StatelessWidget {
  final String image;
  final String text;
  final String price;
  final bool isSelected;
  final Function onPressed;

  BurgerItemBox({this.image, this.text, this.price, this.isSelected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color _color = Color.fromRGBO(255, 203, 63, 1);  // like amber color

    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: isSelected ? Colors.red : Colors.grey[100],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // image
                Image.asset(image,
                    width: constraints.constrainWidth() * 0.50,
                    fit: BoxFit.fitWidth),

                // text
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  price,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: isSelected ? Colors.white : _color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
