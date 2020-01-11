import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressBar extends StatelessWidget {
  double value = 1.0;
  double width;

  ProgressBar({@required this.value , @required this.width});
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical : 3.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 10,
            width : width
          ),
          Container(
            height: 10,
            width: width * value,
            decoration: BoxDecoration(
              color : ThemeSchema.secondaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
          )
        ],
      ),
    );
  }
}
