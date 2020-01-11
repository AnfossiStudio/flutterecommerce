import 'package:ecommerceapp/Utilities/SizesEnum.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SizeItem extends StatefulWidget {
  bool _selected = false;
  final Function onPressed;
  final Sizes size;

  SizeItem({this.onPressed, @required this.size});

  @override
  _SizeItemState createState() => _SizeItemState();
}

class _SizeItemState extends State<SizeItem> {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Flexible(
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget._selected = !widget._selected;
          });
          widget.onPressed(widget.size);
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: widget._selected ? ThemeSchema.secondaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget._selected ? ThemeSchema.secondaryColor : ThemeSchema.textColor,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              printSize(widget.size),
              style: TextStyle(
                color: widget._selected ? Colors.white : ThemeSchema.textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
