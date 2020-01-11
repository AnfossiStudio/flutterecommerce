import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  DropDownButton({@required this.text , @required this.onPressed});

  @override
  Widget build(BuildContext context) {

    final ThemeSchema = Provider.of<ThemeApp>(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: ThemeSchema.primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 20,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              text,
              style: ThemeSchema.descriptive,
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: ThemeSchema.textColor,
            )
          ],
        ),
      ),
    );;
  }
}
