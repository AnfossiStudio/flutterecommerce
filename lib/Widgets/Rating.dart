import 'package:ecommerceapp/Utilities/theme.dart';
import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  double size = 12.0;
  bool text = false;
  bool center = true;

  Rating({this.size, this.text , this.center});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: center == true ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: size,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: size,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: size,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: size,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: size,
        ),
        text == true
            ? SizedBox(
                width: 5,
              )
            : SizedBox.shrink(),
        text == true
            ? Text(
                '(10)',
                style: ThemeSchema.helper
              )
            : SizedBox.shrink()
      ],
    );
  }
}
