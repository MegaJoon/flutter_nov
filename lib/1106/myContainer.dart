import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final String image;
  final String name;
  final bool isSelected;
  final Function onTap;

  MyContainer({this.image, this.name, this.isSelected, this.onTap});

  @override
  Widget build(BuildContext context) {
    Color _color = Color.fromRGBO(118, 199, 230, 1);
    Color _btnColor = Color.fromRGBO(246, 118, 88, 1);

    return Transform.translate(
      offset: Offset(0.0, isSelected? 16.0 : 0.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(right: 16.0, bottom: isSelected? 16.0 : 16.0,),
          width: 64.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(48.0),
              topRight: Radius.circular(48.0),
              bottomLeft: Radius.circular(48.0),
              bottomRight: Radius.circular(48.0),
            ),
            color: isSelected? _btnColor : _color.withOpacity(0.5),
            boxShadow: [BoxShadow(
              color: Colors.black12, spreadRadius: 1, blurRadius: 1,
            )]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // profile image
              Container(
                margin: EdgeInsets.only(top: 4.0),
                height: 52.0,
                width: 52.0,
                decoration: BoxDecoration(shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                height: 52.0,
                child: Text(name.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w600),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
