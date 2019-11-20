import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class MyCustomBottomItem extends StatelessWidget {
  final IconData icon;
  final bool isBadge;
  final String text;
  final bool isSelected;
  final Function onPressed;

  MyCustomBottomItem(
      {this.icon, this.isBadge, this.text, this.isSelected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // click available
      onTap: onPressed,
      // main
      child: Container(
        height: 80.0,
        width: MediaQuery.of(context).size.width / 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // icon in container
            Container(
              height: 48.0,
              width: 48.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? Colors.blueAccent.withOpacity(0.2)
                    : Colors.white,
              ),
              child: Center(
                child: isBadge
                    ? Badge(
                        showBadge: true,
                        position: BadgePosition(top: -5, right: -5),
                        child: Icon(icon,
                            size: 28.0,
                            color: isSelected ? Colors.indigo : Colors.grey),
                      )
                    : Icon(icon,
                        size: 28.0,
                        color: isSelected ? Colors.indigo : Colors.grey),
              ),
            ),

            // text
            Text(
              text,
              style: TextStyle(
                fontSize: 12.0,
                color: isSelected ? Colors.black : Colors.grey[500],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
