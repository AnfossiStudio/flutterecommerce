import 'dart:math';

import 'package:ecommerceapp/Widgets/FavoriteButton.dart';
import 'package:ecommerceapp/Widgets/Rating.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            bottom: 16,
            left: 16,
            right: 16,
          ),
          height: 120,
          decoration: BoxDecoration(
              color: ThemeSchema.primaryColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/model${Random().nextInt(7) + 1}.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Pullover',
                      style: ThemeSchema.headline3,
                    ),
                    Text(
                      'Mango',
                      style: ThemeSchema.helper,
                    ),
                    Rating(
                      size: 16,
                      text: true,
                    ),
                    Text(
                      '\$53',
                      style: ThemeSchema.subhead,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 5,
          bottom: 5,
          child: FavoriteButton(),
        )
      ],
    );
  }
}
