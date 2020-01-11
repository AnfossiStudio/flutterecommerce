import 'package:flutter/material.dart';

class RatingReview extends StatelessWidget {
  double size = 11.0;
  bool center = true;
  int index = 5;

  RatingReview({this.size, this.center, this.index});

  @override
  Widget build(BuildContext context) {
    List<Icon> _stars = [
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
      )
    ];
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: Row(
          mainAxisAlignment: center == true
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: _stars.getRange(0, index).toList()),
    );
  }
}
