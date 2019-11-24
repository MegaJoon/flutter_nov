import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  final String image;
  final String text;
  final String onSale;
  final bool isSelected;
  final Function onPressed;

  BurgerTab({this.image, this.text, this.onSale, this.isSelected, this.onPressed});

  @override
  Widget build(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.center,
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

                onSale == null
                    ? Container()
                    : Container(
                        margin: EdgeInsets.only(top: 4.0),
                        height: 16.0,
                        width: 48.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.grey[100].withOpacity(0.5),
                        ),
                        child: Center(
                          child: Text(
                            onSale,
                            style: TextStyle(
                                fontSize: 8.0,
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
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
