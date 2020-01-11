import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatefulWidget {
  bool _selected = false;
  Function onPressed;
  String category;

  CategoryItem({this.category  = 'category', this.onPressed});

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);

    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget._selected = !widget._selected;
          });
          return widget.onPressed(widget.category);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          margin: EdgeInsets.only(right: 16),
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
              widget.category,
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
