import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class RatingAction extends StatefulWidget {
  double size = 11.0;
  bool center = true;
  int _index = 0;

  RatingAction({this.size, this.center});

  @override
  _RatingActionState createState() => _RatingActionState();
}

class _RatingActionState extends State<RatingAction> {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);

    List<Widget> _stars = [
      GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.star,
          color: Colors.yellow,
          size: widget.size,
        ),
      ),
      Icon(
        Icons.star,
        color: Colors.yellow,
        size: widget.size,
      ),
      Icon(
        Icons.star,
        color: Colors.yellow,
        size: widget.size,
      ),
      Icon(
        Icons.star,
        color: Colors.yellow,
        size: widget.size,
      ),
      Icon(
        Icons.star,
        color: Colors.yellow,
        size: widget.size,
      )
    ];

    builder(index){
      List<Widget> _r = [];
      for(int i = 0; i < 5;i++){
        _r.add(
            GestureDetector(
              onTap: () {
                setState(() {
                  widget._index = i;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal : 8.0),
                child: Icon(
                  index < i ? FontAwesomeIcons.star : FontAwesomeIcons.solidStar,
                  color: index < i ? ThemeSchema.iconsColor : Colors.yellow,
                  size: widget.size,
                ),
              ),
            )
        );
      }
      return _r;
    }

    return Container(
      padding: EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: widget.center == true
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: builder(widget._index),
      ),
    );
  }
}
