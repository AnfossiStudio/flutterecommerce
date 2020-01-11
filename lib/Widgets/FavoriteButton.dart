import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatefulWidget {
  EdgeInsetsGeometry padding;
  bool _toggle_hide = false;

  FavoriteButton({
    this.padding = const EdgeInsets.all(8),
  });

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          widget._toggle_hide = !widget._toggle_hide;
        });
      },
      child: Container(
        //TODO : Night Mode
        decoration: BoxDecoration(
          color: ThemeSchema.primaryColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.2),
              blurRadius: 20,
              spreadRadius: 3,
            ),
          ],
        ),
        padding: widget.padding,
        child: Icon(
          widget._toggle_hide == true ? Icons.favorite : Icons.favorite_border,
          size: 16.0,
          color: widget._toggle_hide == true
              ? ThemeSchema.secondaryColor
              : ThemeSchema.iconsColor,
        ),
      ),
    );
  }
}
