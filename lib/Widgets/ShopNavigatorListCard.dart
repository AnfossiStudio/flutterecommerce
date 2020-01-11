import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopNavigatorListCard extends StatelessWidget {
  String text;

  ShopNavigatorListCard({@required this.text});
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Container(
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(child: Text(text , style : ThemeSchema.descriptive.copyWith(color : Colors.white,),),),
    );
  }
}
