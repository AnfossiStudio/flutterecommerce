import 'package:ecommerceapp/Utilities/theme.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;
  final EdgeInsetsGeometry padding;
  Color color;
  Color textColor;

  Button({@required this.text , @required this.onPressed , this.padding = EdgeInsets.zero , this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  padding,
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: textColor != null ? textColor : Colors.white
            ),
          ),
          color: color != null ? color : ThemeSchema.secondaryColor,
          textColor: Colors.white,
          onPressed: this.onPressed,
        ),
      ),
    );
  }
}
