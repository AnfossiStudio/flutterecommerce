import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorItem extends StatefulWidget {
  bool _selected = false;
  final Function onPressed;
  final Color color;

  ColorItem({
    @required this.onPressed,
    @required this.color,
  });

  @override
  _ColorItemState createState() => _ColorItemState();
}

class _ColorItemState extends State<ColorItem> {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Flexible(
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget._selected = !widget._selected;
          });
          widget.onPressed(widget.color);
        },
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(30),
            border: widget._selected == true
                ? Border.all(
                    color: ThemeSchema.secondaryColor,
                    width: 2,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
