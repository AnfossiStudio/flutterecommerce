import 'package:ecommerceapp/Widgets/Rating.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Comment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: ThemeSchema.primaryColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 20,
                  spreadRadius: 3,
                ),
              ],
            ),
            padding: EdgeInsets.all(24),
            width : double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Helene Moore' , style: ThemeSchema.descriptive,),
                Padding(
                  padding: const EdgeInsets.only(top : 8.0  , bottom : 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Rating(size: 14,),
                      Text('June 5, 2019' , style: ThemeSchema.helper,),
                    ],
                  ),
                ),
                Text("The dress is great! Very classy and comfortable > it fit perfectly! I'm and 150 pounds> I am a 34B ches. This dress would e who are shorter but could be hemmed> I wouldn't recommend it for those big chested and it fit me perfectly chested and it fit me perfectly > The underarms were not too wide and the dress was made well." , style: ThemeSchema.descriptiveLight.copyWith(height: 1.4),)
              ],
            ),
          ),
          Positioned(
            top: -16,
            left: -16,
            child: Container(
              width: 40,
              height: 40,
              decoration : BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  image : AssetImage('assets/images/model7.jpg'),
                  fit: BoxFit.cover
                )
              )
            ),
          )
        ],
      ),
    );
  }
}
