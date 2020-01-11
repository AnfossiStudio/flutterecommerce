import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class IconButtonAction extends StatefulWidget {
  final IconData icon;
  final size;
  final Color color;
  final Function onPressed;

  IconButtonAction({
    @required this.onPressed,
    this.icon = Icons.favorite,
    this.size = 16.0,
    this.color = Colors.grey,
  });

  @override
  _IconButtonActionState createState() => _IconButtonActionState();
}

class _IconButtonActionState extends State<IconButtonAction> {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return GestureDetector(
      onTap: (){
        widget.onPressed();
      },
      child: Container(
        //TODO : Night Mode
        decoration: BoxDecoration(
          color: ThemeSchema.primaryColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        padding: EdgeInsets.all(8),
        child:Icon(
          widget.icon,
          size: widget.size,
          color: ThemeSchema.iconsColor,
        ),
      ),
    );
  }
}
