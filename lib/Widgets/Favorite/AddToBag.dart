import 'package:ecommerceapp/Utilities/theme.dart';
import 'package:flutter/material.dart';

class AddToBag extends StatefulWidget {
  EdgeInsetsGeometry padding;
  bool _toggle_hide = false;

  AddToBag({
    this.padding = const EdgeInsets.all(8),
  });

  @override
  _AddToBagState createState() => _AddToBagState();
}

class _AddToBagState extends State<AddToBag> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        //TODO : Night Mode
        decoration: BoxDecoration(
          color: ThemeSchema.secondaryColor,
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
          Icons.local_mall,
          size: 16.0,
          color: Colors.white
        ),
      ),
    );
  }
}
